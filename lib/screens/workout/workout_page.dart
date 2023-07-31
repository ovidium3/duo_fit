import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '/constants/color_constants.dart';
import '/constants/text/general_texts.dart';
//import '/controllers/workout_controller.dart';
import '/models/set_model.dart';
import '/models/workout_model.dart';
import '/screens/home/home_page.dart';
import '/widgets/buttons/auth_button.dart';

import 'components/finish_button.dart';
import 'components/exercise_card.dart';
import 'components/rest_timer.dart';
import 'components/workout_timer.dart';

// temporary
import '/constants/data/workout_data.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  // Dependency injection
  // final WorkoutController workoutController = Get.put(WorkoutController());

  // final WorkoutModel workout = await workoutController.getWorkout();

  // Temp hard coded
  final WorkoutModel workout = WorkoutData.upperBody;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    _modifyWorkoutStatusInFirestore(true, workout.title);
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: ColorConstants.darkBlue,
      child: SafeArea(
        child: _createWorkoutContent(context),
      ),
    );
  }

  void _modifyWorkoutStatusInFirestore(
      bool isInWorkout, String workoutName) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      try {
        final docRef = _firestore
            .collection('Users')
            .doc(currentUser.uid)
            .collection('statistics')
            .doc('stats');

        await docRef.update(
            {'isInWorkout': isInWorkout, 'currentWorkout': workoutName});
      } catch (error) {
        throw Exception(error);
      }
    }
  }

  Widget _createWorkoutContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 15),
              RestTimerButton(
                title: 'Timer',
                isEnabled: false,
                onTimerChanged: (newTimerValue) {},
              ),
              const Spacer(),
              const WorkoutTimer(),
              const Spacer(),
              FinishButton(
                onTap: () {
                  _showFinishWorkoutPopup(context);
                  // workoutController.finishWorkout();
                },
              ),
              const SizedBox(width: 15),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: workout.exerciseDataList.length,
              itemBuilder: (context, index) {
                final exercise = workout.exerciseDataList[index];
                final sets = workout.exerciseDataList[index].needsWarmup
                    ? workout.exerciseDataList[index].sets + 1
                    : workout.exerciseDataList[index].sets;

                return FutureBuilder<List<Map<String, dynamic>>>(
                  future: _fetchPreviousWorkoutData(exercise.title),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final previousDataList = snapshot.data!;
                      List<SetModel> setDataList = [];
                      for (var i = 0; i < sets; i++) {
                        String previousData = "-x-";
                        String setType = "D";
                        if (i < previousDataList.length) {
                          previousData =
                              previousDataList.elementAt(i).values.elementAt(1);
                          setType = previousDataList.elementAt(i).values.first;
                        }
                        final setData = SetModel(
                          exerciseTitle: exercise.title,
                          previousData: previousData,
                          setType: setType == 'D'
                              ? _getSetType(i, exercise.needsWarmup)
                              : setType,
                        );
                        setDataList.add(setData);
                      }
                      return ExerciseCard(
                        exercise: exercise,
                        setDataList: setDataList,
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return const CupertinoActivityIndicator();
                    }
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: AuthButton(
              text: TextConstants.cancelWorkout,
              isOutlined: true,
              onPressed: () {
                _modifyWorkoutStatusInFirestore(false, "");
                Get.to(const HomePage());
                // workoutController.cancelWorkout();
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getSetType(int i, bool needsWarmup) {
    if (needsWarmup) {
      if (i == 0) {
        return "W";
      }
      return i.toString();
    } else {
      return (i + 1).toString();
    }
  }

  void _showFinishWorkoutPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Finish Workout?',
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  FinishButton(
                    onTap: () {
                      _modifyWorkoutStatusInFirestore(false, "");
                      _saveWorkoutDataToFirestore();
                      Get.to(const HomePage());
                    },
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<List<Map<String, dynamic>>> _fetchPreviousWorkoutData(
      String exerciseId) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    List<Map<String, dynamic>> previousDataList = [];

    if (currentUser != null) {
      try {
        String mostRecentWorkoutDate = await _getMostRecentWorkoutDate();
        if (mostRecentWorkoutDate != "") {
          final snapshot = await _firestore
              .collection('Users')
              .doc(currentUser.uid)
              .collection('customWorkouts')
              .doc(mostRecentWorkoutDate)
              .get();
          if (snapshot.exists) {
            final data = snapshot.data() as Map<String, dynamic>;
            final dataList = data.values.first;
            for (Map<String, dynamic> prevData in dataList) {
              if (prevData.values.first.contains(exerciseId)) {
                for (Map<String, dynamic> actualPrevData
                    in prevData.values.elementAt(1)) {
                  previousDataList.add(actualPrevData);
                }
              }
            }
          }
        } else {
          return previousDataList;
        }
      } catch (error) {
        throw Exception(error);
      }
    }
    return previousDataList;
  }

  Future<String> _getMostRecentWorkoutDate() async {
    String mostRecent = "";
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final snapshot = await _firestore
          .collection('Users')
          .doc(currentUser.uid)
          .collection('statistics')
          .doc('stats')
          .get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        mostRecent = data['mostRecent${workout.title}Workout'] ?? "";
      }
    }
    return mostRecent;
  }

  void _saveWorkoutDataToFirestore() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final setListData = SetListData();
      final List<Map<String, dynamic>> setList = setListData.getSetList();
      final docRef = _firestore
          .collection('Users')
          .doc(currentUser.uid)
          .collection('customWorkouts')
          .doc(formattedDate);

      final exercisesData = setList.map((exercise) {
        final setDataList = exercise['setDataList'].map((setData) {
          return {
            'previousData': setData['previousData'],
            'setType': setData['setType'],
          };
        }).toList();

        return {
          'id': exercise['id'],
          'setDataList': setDataList,
        };
      }).toList();

      await docRef.set({
        'exercises': exercisesData,
      });

      try {
        final snapshot = await _firestore
            .collection('Users')
            .doc(currentUser.uid)
            .collection('statistics')
            .doc('stats')
            .get();

        if (snapshot.exists) {
          final workoutName = workout.title;

          await _firestore
              .collection('Users')
              .doc(currentUser.uid)
              .collection('statistics')
              .doc('stats')
              .update({'mostRecent${workoutName}Workout': formattedDate});
        }
      } catch (error) {
        throw Exception(error);
      }
    }
  }

  final setListData = []; // reset list for next workout
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/text/app_texts.dart';
import '/controllers/workout_controller.dart';
import '/models/set_model.dart';
import '/models/workout_model.dart';
import '/widgets/action_button.dart';

import 'components/exercise_card.dart';
import 'components/workout_app_bar.dart';

// Workout page where user can log their progress as they work out
class WorkoutPage extends GetView<WorkoutController> {
  final WorkoutModel workout;

  const WorkoutPage({required this.workout, super.key});

  @override
  Widget build(BuildContext context) {
    // Update workout info in firestore
    controller.currentWorkout.value = workout;
    controller.isInWorkout.value = true;
    controller.updateWorkoutStatus();

    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: WorkoutAppBar(onTap: () {
          controller.finishWorkout();
        }),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ColorConstants.backgroundColor,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Actual workout content - exercises and sets
                Expanded(
                  child: ListView.builder(
                    itemCount: workout.exerciseDataList.length,
                    itemBuilder: (context, index) {
                      final exercise = workout.exerciseDataList[index];
                      final sets = workout.exerciseDataList[index].needsWarmup
                          ? workout.exerciseDataList[index].sets + 1
                          : workout.exerciseDataList[index].sets;

                      // Build method for each exercise's sets
                      return FutureBuilder<List<Map<String, dynamic>>>(
                        future:
                            controller.fetchPreviousWorkoutData(exercise.title),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            // Extract data from firestore and update set
                            final previousDataList = snapshot.data!;
                            List<SetModel> setDataList = [];
                            for (var i = 0; i < sets; i++) {
                              String previousData = '-x-';
                              String setType = 'D';
                              if (i < previousDataList.length) {
                                previousData = previousDataList
                                    .elementAt(i)
                                    .values
                                    .elementAt(1);
                                setType =
                                    previousDataList.elementAt(i).values.first;
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
                            return const SpinKitThreeBounce(
                              color: ColorConstants.primaryColor,
                              duration: Duration(seconds: 1),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),

                // Space between workout content and cancel workout button
                const SizedBox(height: 10),

                // Cancel workout button
                Center(
                  child: ActionButton(
                    text: TextConstants.cancelWorkout,
                    isOutlined: true,
                    onPressed: () {
                      controller.cancelWorkout();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to update set type in set data
  String _getSetType(int i, bool needsWarmup) {
    if (needsWarmup) {
      if (i == 0) {
        return 'W';
      }
      return i.toString();
    } else {
      return (i + 1).toString();
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duo_fit/screens/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '/constants/text/general_texts.dart';
import '/controllers/dialog_controller.dart';
// import '/models/set_model.dart';
import '/models/workout_model.dart';
import '/constants/data/workout_data.dart';

class WorkoutController extends GetxController {
  // Dependency injection
  final DialogController dialogController = Get.put(DialogController());

  // Firebase instances
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  // GetX state variables
  Rx<WorkoutModel> currentWorkout = Rx<WorkoutModel>(WorkoutData.placeholder);

  RxBool allDone = false.obs;

  Rx<List<Map<String, dynamic>>> setListData =
      Rx<List<Map<String, dynamic>>>([]);

  RxBool isInWorkout = false.obs;

  // Add your GetX state update methods here, if needed
  // Example:
  // void updateIsInWorkout(bool value) => isInWorkout.value = value;
  // void updateCurrentWorkout(String workoutName) => currentWorkout.value = workoutName;

  Future<void> modifyWorkoutStatus() async {
    //authStateController.isInWorkout.value = isInWorkout;
    print('in mod workout status');
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      print('in user');
      try {
        final docRef = _firestore
            .collection('Users')
            .doc(currentUser.uid)
            .collection('userStatistics')
            .doc('stats');

        await docRef.update({
          'isInWorkout': isInWorkout.value,
          'currentWorkout': currentWorkout.value.title == 'Placeholder'
              ? ''
              : currentWorkout.value.title,
        });
        print('doc ref updated');
      } catch (error) {
        print('error');
        print(error);
        throw Exception(error);
      }
    }
  }

  Future<List<Map<String, dynamic>>> fetchPreviousWorkoutData(
      String exerciseId) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    List<Map<String, dynamic>> previousDataList = [];

    if (currentUser != null) {
      try {
        String mostRecentWorkoutDate = await getMostRecentWorkoutDate();
        if (mostRecentWorkoutDate != "") {
          final snapshot = await _firestore
              .collection('Users')
              .doc(currentUser.uid)
              .collection('userWorkouts')
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
      } catch (e) {
        throw Exception(e);
      }
    }
    return previousDataList;
  }

  Future<List<Map<String, dynamic>>> getSetData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    List<Map<String, dynamic>> data = [];
    if (currentUser != null) {
      try {
        String mostRecentWorkoutDate = await getMostRecentWorkoutDate();
        if (mostRecentWorkoutDate != "") {
          final snapshot = await _firestore
              .collection('Users')
              .doc(currentUser.uid)
              .collection('userWorkouts')
              .doc(mostRecentWorkoutDate)
              .get();
          if (snapshot.exists) {
            data = snapshot.data() as List<Map<String, dynamic>>;
          }
        }
      } catch (e) {
        throw Exception(e);
      }
    }
    return data;
  }

  Future<WorkoutModel> getCurrentWorkout() async {
    String userWorkout = '';
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final snapshot = await _firestore
          .collection('Users')
          .doc(currentUser.uid)
          .collection('userStatistics')
          .doc('stats')
          .get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        userWorkout = data['currentWorkout'];
      }
    }
    return WorkoutData().getWorkoutByName(userWorkout);
  }

  Future<bool> isUserInWorkout() async {
    print('in user isUserInWorkout');
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final snapshot = await _firestore
          .collection('Users')
          .doc(currentUser.uid)
          .collection('userStatistics')
          .doc('stats')
          .get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        return data['isInWorkout'];
      }
    }
    return false;
  }

  Future<String> getMostRecentWorkoutDate() async {
    String mostRecent = "";
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final snapshot = await _firestore
          .collection('Users')
          .doc(currentUser.uid)
          .collection('userStatistics')
          .doc('stats')
          .get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        mostRecent =
            data['mostRecent${currentWorkout.value.title}Workout'] ?? '';
      }
    }
    return mostRecent;
  }

  Future<void> showSetType() async {
    dialogController.showSetType((setType) async {
      await updateSet();
    });
  }

  Future<void> updateSet() async {}

  Future<void> completeSet(Map<String, dynamic> setData) async {
    dialogController.showTimer();
    setListData.value.add(setData);
  }

  Future<void> saveWorkoutData() async {
    print('saving workout data');
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      print('user aint null');
      //final setListData = setDataList.value;
      final List<Map<dynamic, dynamic>> setList = setListData.value;
      print('set list data value: $setListData');
      final docRef = _firestore
          .collection('Users')
          .doc(currentUser.uid)
          .collection('userWorkouts')
          .doc(formattedDate);

      final exercisesData = setList.map((exercise) {
        final setDataList = exercise['setDataList'].map((setData) {
          return {
            'previousData': setData['previousData'],
            'setType': setData['setType'],
          };
        }).toList();

        print('toList success');

        return {
          'id': exercise['id'],
          'setDataList': setDataList,
        };
      }).toList();

      print('id and exercise toLIst');

      await docRef.set({
        'exercises': exercisesData,
      });

      print('docref.set');
      try {
        final snapshot = await _firestore
            .collection('Users')
            .doc(currentUser.uid)
            .collection('userStatistics')
            .doc('stats')
            .get();

        if (snapshot.exists) {
          print('snapshot exists');
          final workoutName = currentWorkout;

          await _firestore
              .collection('Users')
              .doc(currentUser.uid)
              .collection('userStatistics')
              .doc('stats')
              .update({'mostRecent${workoutName}Workout': formattedDate});

          print('stuff updated');
        }
      } catch (error) {
        throw Exception(error);
      }
    }
  }

  bool allSetsComplete() {
    return true;
  }

  Future<void> finishWorkout() async {
    print('finish button tapped');
    dialogController.showConfirmWithActions(
        allSetsComplete()
            ? TextConstants.finishedWorkout
            : TextConstants.incompleteWorkout,
        TextConstants.finish, () async {
      isInWorkout.value = false;
      currentWorkout.value = WorkoutData.placeholder;
      await modifyWorkoutStatus();
      await saveWorkoutData();
      Get.offAll(const HomePage());
    });
  }

  Future<void> cancelWorkout() async {
    dialogController.showConfirmWithActions(
        TextConstants.cancelWorkoutText, TextConstants.cancelWorkout, () async {
      isInWorkout.value = false;
      currentWorkout.value = WorkoutData.placeholder;
      await modifyWorkoutStatus();
      Get.offAll(const HomePage());
    });
  }

  Future<void> setWorkoutInfo() async {
    print('setting workout info');
    isInWorkout.value = await isUserInWorkout();
    if (isInWorkout.value == true) {
      print('user is in workout');
      currentWorkout.value = await getCurrentWorkout();
      setListData.value = await getSetData();
    }
  }

  @override
  void onInit() async {
    await setWorkoutInfo();
    super.onInit();
  }
}

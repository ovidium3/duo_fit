import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '/constants/data/workout_data.dart';
import '/constants/text/dialog_texts.dart';
//import '/controllers/user/user_info_controller.dart';
import '/models/workout_model.dart';
import '/screens/home/home_page.dart';

import 'dialog_controller.dart';

// Controller for handling workout functions like logging sets
class WorkoutController extends GetxController {
  // Dependency injections
  final DialogController dialogController = Get.put(DialogController());
  // final UserInformationController userInfoController =
  //     Get.put(UserInformationController());

  // Firebase user instance
  final User? _user = FirebaseAuth.instance.currentUser;

  // Firebase doc reference for user stats
  final DocumentReference statsDocRef = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('userStatistics')
      .doc('stats');

  // Firebase doc reference for user workouts
  final DocumentReference workoutDocRef = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('userWorkouts')
      .doc(DateFormat('yyyy-MM-dd').format(DateTime.now()));

  // Formatted date for Firestore most recent workout logging
  final String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  // GetX state variables
  RxBool isInWorkout = false.obs;
  Rx<WorkoutModel> currentWorkout = Rx<WorkoutModel>(WorkoutData.placeholder);
  Rx<List<Map<String, dynamic>>> setListData =
      Rx<List<Map<String, dynamic>>>([]);

  // Not implemented yet
  //RxMap<String, dynamic> currentSetData = RxMap<String, dynamic>({});

  // Update workout status in Firestore
  Future<void> updateWorkoutStatus() async {
    if (_user != null) {
      try {
        // Update statistics document with workout status and workout title
        await statsDocRef.update({
          'isInWorkout': isInWorkout.value,
          'currentWorkout': currentWorkout.value.title == 'Placeholder'
              ? ''
              : currentWorkout.value.title,
        });
      } catch (e) {
        // Not many errors to catch here, no need for complex error handling
        throw Exception(e);
      }
    }
  }

  // Get previous data for each exercise from Firestore to build workout page
  Future<List<Map<String, dynamic>>> fetchPreviousWorkoutData(
      String exerciseId) async {
    List<Map<String, dynamic>> previousDataList = [];

    if (_user != null) {
      try {
        // Get most recent workout date
        String mostRecentWorkoutDate = await getMostRecentWorkout();
        if (mostRecentWorkoutDate != '') {
          final snapshot = await workoutDocRef.get();
          if (snapshot.exists) {
            // Extract snapshot data as a Map of String, List
            final data = snapshot.data() as Map<String, dynamic>;
            final dataList = data.values.first;

            // Extract data from dataList to add to previousDataList
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
          // Return empty list if no previous data exists
          return previousDataList;
        }
      } catch (e) {
        // Not many errors to catch here, no need for complex error handling
        throw Exception(e);
      }
    }
    // If this hits, you probably have bigger problems than this list
    return previousDataList;
  }

  // Set data list getter, not implemented yet as still buggy
  // Future<List<Map<String, dynamic>>> getSetData() async {
  //   final currentUser = FirebaseAuth.instance.currentUser;
  //   List<Map<String, dynamic>> data = [];
  //   if (currentUser != null) {
  //     try {
  //       String mostRecentWorkoutDate = await getMostRecentWorkout();
  //       if (mostRecentWorkoutDate != '') {
  //         final snapshot = await _firestore
  //             .collection('Users')
  //             .doc(currentUser.uid)
  //             .collection('userWorkouts')
  //             .doc(mostRecentWorkoutDate)
  //             .get();
  //         if (snapshot.exists) {
  //           data = snapshot.data() as List<Map<String, dynamic>>;
  //         }
  //       }
  //     } catch (e) {
  //       throw Exception(e);
  //     }
  //   }
  //   return data;
  // }

  // Get the current workout, called only when user is in workout
  Future<WorkoutModel> getCurrentWorkout() async {
    String userWorkout = '';
    if (_user != null) {
      // Get user stats doc snapshot
      final snapshot = await statsDocRef.get();
      if (snapshot.exists) {
        // Extract current workout from Firestore
        final data = snapshot.data() as Map<String, dynamic>;
        userWorkout = data['currentWorkout'];
      }
    }
    // Turns string of workout name to workout model by looping through a list
    return getWorkoutByName(userWorkout);
  }

  // Returns a workout model accessed by name
  WorkoutModel getWorkoutByName(String name) {
    for (WorkoutModel workout in WorkoutData.allWorkouts) {
      if (workout.title == name) {
        return workout;
      }
    }
    return WorkoutData.placeholder; // Arbitrary workout signifying error
  }

  // Check if user is in workout, called on init
  Future<bool> isUserInWorkout() async {
    if (_user != null) {
      // Get user stats doc snapshot
      final snapshot = await statsDocRef.get();
      if (snapshot.exists) {
        // Extract bool isInWorkout from firestore
        final data = snapshot.data() as Map<String, dynamic>;
        return data['isInWorkout'];
      }
    }
    // Hits if user is not signed in
    return false;
  }

  // Get most recent workout date
  Future<String> getMostRecentWorkout() async {
    //String mostRecent = '';
    if (_user != null) {
      // Get user stats doc snapshot
      final snapshot = await statsDocRef.get();
      if (snapshot.exists) {
        // Extract most recent workout date as string and return it
        final data = snapshot.data() as Map<String, dynamic>;
        return data['mostRecent${currentWorkout.value.title}Workout'] ?? '';
      }
    }
    // If no recent workout exists, return empty string
    return '';
  }

  // Events that trigger upon marking a set as complete
  Future<void> completeSet(Map<String, dynamic> setData) async {
    // Open up rest timer dialog, add set data to list, update current set data
    dialogController.showRestTimer();
    setListData.value.add(setData);
    //currentSetData.value = setData; // Not integrated fully yet
  }

  // Save all workout data to firestore
  Future<void> saveWorkoutData() async {
    if (_user != null) {
      // Extract data from controller RxList
      final List<Map<dynamic, dynamic>> setList = setListData.value;

      // Map out data for each exercise, and turn it into a list
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

      // Set data from list into a list of exercise data
      await workoutDocRef.set({'exercises': exercisesData});

      try {
        // Get stats doc ref snapshot
        final snapshot = await statsDocRef.get();

        if (snapshot.exists) {
          // Update most recent workout in Firestore stats doc
          final workoutName = currentWorkout.value.title;
          await statsDocRef
              .update({'mostRecent${workoutName}Workout': formattedDate});
        }
      } catch (error) {
        // Not many errors to catch here, no need for complex error handling
        throw Exception(error);
      }
    }
  }

  // Future<void> updateWorkoutsCompleted() async {
  //   await statsDocRef.update(
  //       {'Workouts Completed': (userInfoController.userProfileStats[2] + 1)});
  // }

  Future<void> finishWorkout() async {
    // Ask user to confirm finishing workout
    dialogController.showConfirmWithActions(
        DialogTexts.finishedWorkout, DialogTexts.finish, () async {
      // Save workout data to Firestore, update workout status
      await saveWorkoutData();
      isInWorkout.value = false;
      currentWorkout.value = WorkoutData.placeholder;
      await updateWorkoutStatus();

      // Update workouts completed in firestore and go to home page
      //await updateWorkoutsCompleted();
      Get.to(const HomePage());
    });
  }

  Future<void> cancelWorkout() async {
    // Ask user to confirm canceling workout
    dialogController.showConfirmWithActions(
        DialogTexts.cancelWorkoutText, DialogTexts.cancelWorkout, () async {
      // Update variables to reflect non-workout status and send to home page
      isInWorkout.value = false;
      currentWorkout.value = WorkoutData.placeholder;
      await updateWorkoutStatus();

      Get.to(const HomePage());
    });
  }

  Future<void> setWorkoutInfo() async {
    // Update workout status
    isInWorkout.value = await isUserInWorkout();
    if (isInWorkout.value == true) {
      // Get current workout from firestore and any existing set data
      currentWorkout.value = await getCurrentWorkout();
      //setListData.value = await getSetData();
    }
  }

  @override
  void onInit() async {
    // Get workout info to set up workout page accordingly
    await setWorkoutInfo();
    super.onInit();
  }
}

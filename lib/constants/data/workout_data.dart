import '/constants/media_constants.dart';
import '/constants/text/workout_texts.dart';
import '/models/workout_model.dart';

import 'exercise_data.dart';

// A class that represents all components of a workout, including a placeholder
class WorkoutData {
  // Upper body
  static final upperBody = WorkoutModel(
    title: WorkoutTexts.upperTitle,
    exercises: WorkoutTexts.upperExercises,
    duration: WorkoutTexts.upperDuration,
    image: MediaConstants.upper,
    exerciseDataList: [
      ExerciseData.shoulderPressExercise,
      ExerciseData.pullUpExercise,
      ExerciseData.inclineBenchExercise,
      ExerciseData.seatedRowExercise,
      ExerciseData.lateralRaiseExercise
    ],
  );

  // Push
  static final push = WorkoutModel(
    title: WorkoutTexts.pushTitle,
    exercises: WorkoutTexts.pushExercises,
    duration: WorkoutTexts.pushDuration,
    image: MediaConstants.push,
    exerciseDataList: [
      ExerciseData.shoulderPressExercise,
      ExerciseData.inclineBenchExercise,
      ExerciseData.tricepExtensionExercise,
      ExerciseData.lateralRaiseExercise
    ],
  );

  // Pull
  static final pull = WorkoutModel(
    title: WorkoutTexts.pullTitle,
    exercises: WorkoutTexts.pullExercises,
    duration: WorkoutTexts.pullDuration,
    image: MediaConstants.pull,
    exerciseDataList: [
      ExerciseData.pullUpExercise,
      ExerciseData.seatedRowExercise,
      ExerciseData.bicepCurlExercise,
      ExerciseData.reverseFlyExercise
    ],
  );

  // Legs
  static final legs = WorkoutModel(
    title: WorkoutTexts.legsTitle,
    exercises: WorkoutTexts.legsExercises,
    duration: WorkoutTexts.legsDuration,
    image: MediaConstants.legs,
    exerciseDataList: [
      ExerciseData.squatExercise,
      ExerciseData.legPressExercise,
      ExerciseData.legExtensionExercise,
      ExerciseData.hamstringCurlExercise
    ],
  );

  // Full body
  static final fullBody = WorkoutModel(
    title: WorkoutTexts.fullBodyTitle,
    exercises: WorkoutTexts.fullBodyExercises,
    duration: WorkoutTexts.fullBodyDuration,
    image: MediaConstants.fullBody,
    exerciseDataList: [
      ExerciseData.shoulderPressExercise,
      ExerciseData.squatExercise,
      ExerciseData.pullUpExercise,
      ExerciseData.inclineBenchExercise,
      ExerciseData.seatedRowExercise
    ],
  );

  // Arms
  static final arms = WorkoutModel(
    title: WorkoutTexts.armsTitle,
    exercises: WorkoutTexts.armsExercises,
    duration: WorkoutTexts.armsDuration,
    image: MediaConstants.arms,
    exerciseDataList: [
      ExerciseData.skullcrusherExercise,
      ExerciseData.barbellCurlExercise,
      ExerciseData.tricepExtensionExercise,
      ExerciseData.bicepCurlExercise,
    ],
  );

  // Abs
  static final abs = WorkoutModel(
    title: WorkoutTexts.absTitle,
    exercises: WorkoutTexts.absExercises,
    duration: WorkoutTexts.absDuration,
    image: MediaConstants.abs,
    exerciseDataList: [
      ExerciseData.legRaiseExercise,
      ExerciseData.kneeRaiseExercise,
      ExerciseData.russianTwistExercise,
      ExerciseData.crunchExercise,
    ],
  );

  // Shoulders
  static final shoulders = WorkoutModel(
    title: WorkoutTexts.shouldersTitle,
    exercises: WorkoutTexts.shouldersExercises,
    duration: WorkoutTexts.shouldersDuration,
    image: MediaConstants.shoulders,
    exerciseDataList: [
      ExerciseData.shoulderPressExercise,
      ExerciseData.lateralRaiseExercise,
      ExerciseData.reverseFlyExercise,
    ],
  );

  // Placeholder workout containing null data
  static final placeholder = WorkoutModel(
    title: WorkoutTexts.placeholderTitle,
    exercises: WorkoutTexts.placeholderExercises,
    duration: WorkoutTexts.placeholderDuration,
    image: MediaConstants.noImageAvailable,
    exerciseDataList: [],
  );

  // List of all valid workouts
  static final List<WorkoutModel> allWorkouts = [
    upperBody,
    push,
    pull,
    legs,
    fullBody,
    arms,
    abs,
    shoulders,
  ];
}

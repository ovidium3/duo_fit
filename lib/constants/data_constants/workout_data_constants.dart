import '../media_constants.dart';
import '/constants/text_constants/workout_text_constants.dart';
import '/models/workout_model.dart';
import '/constants/data_constants/exercise_data_constants.dart';

class WorkoutDataConstants {
  // Upper body
  static final upperBody = WorkoutModel(
    title: WorkoutTextConstants.upperTitle,
    exercises: WorkoutTextConstants.upperExercises,
    minutes: WorkoutTextConstants.upperMinutes,
    image: MediaConstants.upper,
    exerciseDataList: [
      ExerciseDataConstants.shoulderPressExercise,
      ExerciseDataConstants.pullUpExercise,
      ExerciseDataConstants.inclineBenchExercise,
      ExerciseDataConstants.seatedRowExercise,
      ExerciseDataConstants.lateralRaiseExercise
    ],
  );

  // Push
  static final push = WorkoutModel(
    title: WorkoutTextConstants.pushTitle,
    exercises: WorkoutTextConstants.pushExercises,
    minutes: WorkoutTextConstants.pushMinutes,
    image: MediaConstants.push,
    exerciseDataList: [
      ExerciseDataConstants.shoulderPressExercise,
      ExerciseDataConstants.inclineBenchExercise,
      ExerciseDataConstants.tricepExtensionExercise,
      ExerciseDataConstants.lateralRaiseExercise
    ],
  );

  // Pull
  static final pull = WorkoutModel(
    title: WorkoutTextConstants.pullTitle,
    exercises: WorkoutTextConstants.pullExercises,
    minutes: WorkoutTextConstants.pullMinutes,
    image: MediaConstants.pull,
    exerciseDataList: [
      ExerciseDataConstants.pullUpExercise,
      ExerciseDataConstants.seatedRowExercise,
      ExerciseDataConstants.bicepCurlExercise,
      ExerciseDataConstants.reverseFlyExercise
    ],
  );

  // Legs
  static final legs = WorkoutModel(
    title: WorkoutTextConstants.legsTitle,
    exercises: WorkoutTextConstants.legsExercises,
    minutes: WorkoutTextConstants.legsMinutes,
    image: MediaConstants.legs,
    exerciseDataList: [
      ExerciseDataConstants.squatExercise,
      ExerciseDataConstants.legPressExercise,
      ExerciseDataConstants.legExtensionExercise,
      ExerciseDataConstants.hamstringCurlExercise
    ],
  );

  // Full body
  static final fullBody = WorkoutModel(
    title: WorkoutTextConstants.fullBodyTitle,
    exercises: WorkoutTextConstants.fullBodyExercises,
    minutes: WorkoutTextConstants.fullBodyMinutes,
    image: MediaConstants.fullBody,
    exerciseDataList: [
      ExerciseDataConstants.shoulderPressExercise,
      ExerciseDataConstants.squatExercise,
      ExerciseDataConstants.pullUpExercise,
      ExerciseDataConstants.inclineBenchExercise,
      ExerciseDataConstants.seatedRowExercise
    ],
  );

  // Arms
  static final arms = WorkoutModel(
      title: WorkoutTextConstants.armsTitle,
      exercises: WorkoutTextConstants.armsExercises,
      minutes: WorkoutTextConstants.armsMinutes,
      image: MediaConstants.arms,
      exerciseDataList: [
        ExerciseDataConstants.skullcrusherExercise,
        ExerciseDataConstants.barbellCurlExercise,
        ExerciseDataConstants.tricepExtensionExercise,
        ExerciseDataConstants.bicepCurlExercise,
      ]);

  // Abs
  static final abs = WorkoutModel(
      title: WorkoutTextConstants.absTitle,
      exercises: WorkoutTextConstants.absExercises,
      minutes: WorkoutTextConstants.absMinutes,
      image: MediaConstants.abs,
      exerciseDataList: [
        ExerciseDataConstants.legRaiseExercise,
        ExerciseDataConstants.kneeRaiseExercise,
        ExerciseDataConstants.russianTwistExercise,
        ExerciseDataConstants.crunchExercise,
      ]);

  // Shoulders
  static final shoulders = WorkoutModel(
      title: WorkoutTextConstants.shouldersTitle,
      exercises: WorkoutTextConstants.shouldersExercises,
      minutes: WorkoutTextConstants.shouldersMinutes,
      image: MediaConstants.shoulders,
      exerciseDataList: [
        ExerciseDataConstants.shoulderPressExercise,
        ExerciseDataConstants.lateralRaiseExercise,
        ExerciseDataConstants.reverseFlyExercise,
      ]);
}

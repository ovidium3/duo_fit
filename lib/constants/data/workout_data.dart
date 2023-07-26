import '../media_constants.dart';
import '../text/workout_texts.dart';
import '/models/workout_model.dart';
import 'exercise_data.dart';

class WorkoutData {
  // Upper body
  static final upperBody = WorkoutModel(
    title: WorkoutTextConstants.upperTitle,
    exercises: WorkoutTextConstants.upperExercises,
    minutes: WorkoutTextConstants.upperMinutes,
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
    title: WorkoutTextConstants.pushTitle,
    exercises: WorkoutTextConstants.pushExercises,
    minutes: WorkoutTextConstants.pushMinutes,
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
    title: WorkoutTextConstants.pullTitle,
    exercises: WorkoutTextConstants.pullExercises,
    minutes: WorkoutTextConstants.pullMinutes,
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
    title: WorkoutTextConstants.legsTitle,
    exercises: WorkoutTextConstants.legsExercises,
    minutes: WorkoutTextConstants.legsMinutes,
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
    title: WorkoutTextConstants.fullBodyTitle,
    exercises: WorkoutTextConstants.fullBodyExercises,
    minutes: WorkoutTextConstants.fullBodyMinutes,
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
      title: WorkoutTextConstants.armsTitle,
      exercises: WorkoutTextConstants.armsExercises,
      minutes: WorkoutTextConstants.armsMinutes,
      image: MediaConstants.arms,
      exerciseDataList: [
        ExerciseData.skullcrusherExercise,
        ExerciseData.barbellCurlExercise,
        ExerciseData.tricepExtensionExercise,
        ExerciseData.bicepCurlExercise,
      ]);

  // Abs
  static final abs = WorkoutModel(
      title: WorkoutTextConstants.absTitle,
      exercises: WorkoutTextConstants.absExercises,
      minutes: WorkoutTextConstants.absMinutes,
      image: MediaConstants.abs,
      exerciseDataList: [
        ExerciseData.legRaiseExercise,
        ExerciseData.kneeRaiseExercise,
        ExerciseData.russianTwistExercise,
        ExerciseData.crunchExercise,
      ]);

  // Shoulders
  static final shoulders = WorkoutModel(
      title: WorkoutTextConstants.shouldersTitle,
      exercises: WorkoutTextConstants.shouldersExercises,
      minutes: WorkoutTextConstants.shouldersMinutes,
      image: MediaConstants.shoulders,
      exerciseDataList: [
        ExerciseData.shoulderPressExercise,
        ExerciseData.lateralRaiseExercise,
        ExerciseData.reverseFlyExercise,
      ]);
}

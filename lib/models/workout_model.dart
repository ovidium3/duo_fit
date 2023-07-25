import '/models/exercise_model.dart';

class WorkoutModel {
  final String title;
  final String exercises;
  final String minutes;
  int mostRecentWorkout;
  final String image;
  final List<ExerciseModel> exerciseDataList;

  WorkoutModel({
    required this.title,
    required this.exercises,
    required this.minutes,
    this.mostRecentWorkout = -1,
    required this.image,
    required this.exerciseDataList,
  });

  @override
  String toString() {
    return 'WorkoutModel(title: $title, exercices: $exercises, minutes: $minutes, mostRecentWorkout: $mostRecentWorkout, exerciseDataList: $exerciseDataList)';
  }
}

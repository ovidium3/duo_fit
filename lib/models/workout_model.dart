import '/models/exercise_model.dart';

// A class that represents a collection of exercises and other information
class WorkoutModel {
  final String title;
  final String exercises;
  final String duration;
  int mostRecentWorkout;
  final String image;
  final List<ExerciseModel> exerciseDataList;

  WorkoutModel({
    required this.title,
    required this.exercises,
    required this.duration,
    this.mostRecentWorkout = -1,
    required this.image,
    required this.exerciseDataList,
  });

  @override
  String toString() {
    return 'WorkoutModel(title: $title, exercices: $exercises, minutes: $duration, mostRecentWorkout: $mostRecentWorkout, exerciseDataList: $exerciseDataList)';
  }
}

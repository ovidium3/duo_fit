import '/models/set_model.dart';

// A class that represents a specific exercise of a given workout
class ExerciseModel {
  final String title;
  final int sets;
  final bool needsWarmup;
  final String image;
  final String video;
  final String description;
  final List<String> steps;
  List<SetModel> setDataList;

  ExerciseModel({
    required this.title,
    required this.sets,
    required this.needsWarmup,
    required this.image,
    required this.video,
    required this.description,
    required this.steps,
    required this.setDataList,
  });

  @override
  String toString() {
    return 'ExerciseModel(title: $title, sets: $sets, needsWarmup: $needsWarmup, setDataList: $setDataList)';
  }
}

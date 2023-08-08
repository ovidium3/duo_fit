// A class that represents a specific set of a given exercise
class SetModel {
  String exerciseTitle;
  String setType;
  String previousData;
  bool isComplete;
  double? load;
  int? reps;

  SetModel({
    required this.exerciseTitle,
    required this.setType,
    required this.previousData,
    this.isComplete = false,
    this.load,
    this.reps,
  });

  @override
  String toString() {
    return 'SetModel(exerciseTitle: $exerciseTitle, setType: $setType, previousData: $previousData, isComplete: $isComplete, load: $load, reps: $reps)';
  }
}

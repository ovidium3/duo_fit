import '/constants/data/exercise_data.dart';
import '/constants/text/exercise_texts.dart';
import '/models/set_model.dart';

// Used to generate set data for a given exercise
extension GenerateSetDataList on ExerciseData {
  List<SetModel> createSetData(int sets, String exerciseTitle,
      [bool needsWarmup = false]) {
    List<SetModel> setDataList = [];
    if (needsWarmup) {
      setDataList = [
        SetModel(exerciseTitle: exerciseTitle, previousData: "-", setType: "W"),
        ...List<SetModel>.generate(
          3,
          (_) => SetModel(
              exerciseTitle: exerciseTitle, previousData: "-", setType: "D"),
        ),
      ];
    } else {
      setDataList = List<SetModel>.generate(
        3,
        (_) => SetModel(
            exerciseTitle: ExerciseTexts.crunch,
            previousData: "-",
            setType: "D"),
      );
    }
    return setDataList;
  }
}

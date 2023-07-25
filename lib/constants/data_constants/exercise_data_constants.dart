import '/constants/text_constants/exercise_text_constants.dart';
import '../media_constants.dart';
import '/models/exercise_model.dart';
import '/models/set_model.dart';

class ExerciseDataConstants {
  // Shoulder Press
  static final ExerciseModel shoulderPressExercise = ExerciseModel(
    title: ExerciseTextConstants.shoulderPress,
    sets: 3,
    needsWarmup: true,
    image: MediaConstants.shoulderPressImage,
    video: MediaConstants.shoulderPressVideo,
    description: ExerciseTextConstants.shoulderPressDescription,
    steps: [
      ExerciseTextConstants.shoulderPressStep1,
      ExerciseTextConstants.shoulderPressStep2,
      ExerciseTextConstants.shoulderPressStep3,
    ],
    setDataList: [
      SetModel(
          exerciseTitle: ExerciseTextConstants.shoulderPress,
          previousData: "-",
          setType: "W"),
      ...List<SetModel>.generate(
        3,
        (_) => SetModel(
            exerciseTitle: ExerciseTextConstants.shoulderPress,
            previousData: "-",
            setType: "D"),
      ),
    ],
  );

  // Pull Up
  static final ExerciseModel pullUpExercise = ExerciseModel(
    title: ExerciseTextConstants.pullUp,
    sets: 3,
    needsWarmup: true,
    image: MediaConstants.pullUpImage,
    video: MediaConstants.pullUpVideo,
    description: ExerciseTextConstants.pullUpDescription,
    steps: [
      ExerciseTextConstants.pullUpStep1,
      ExerciseTextConstants.pullUpStep2,
      ExerciseTextConstants.pullUpStep3,
    ],
    setDataList: [
      SetModel(
          exerciseTitle: ExerciseTextConstants.pullUp,
          previousData: "-",
          setType: "W"),
      ...List<SetModel>.generate(
        3,
        (_) => SetModel(
            exerciseTitle: ExerciseTextConstants.pullUp,
            previousData: "-",
            setType: "D"),
      ),
    ],
  );

  // Incline Bench
  static final ExerciseModel inclineBenchExercise = ExerciseModel(
    title: ExerciseTextConstants.inclineBench,
    sets: 3,
    needsWarmup: true,
    image: MediaConstants.inclineBenchImage,
    video: MediaConstants.inclineBenchVideo,
    description: ExerciseTextConstants.inclineBenchDescription,
    steps: [
      ExerciseTextConstants.inclineBenchStep1,
      ExerciseTextConstants.inclineBenchStep2,
      ExerciseTextConstants.inclineBenchStep3,
    ],
    setDataList: [
      SetModel(
          exerciseTitle: ExerciseTextConstants.inclineBench,
          previousData: "-",
          setType: "W"),
      ...List<SetModel>.generate(
        3,
        (_) => SetModel(
            exerciseTitle: ExerciseTextConstants.inclineBench,
            previousData: "-",
            setType: "D"),
      ),
    ],
  );

  // Seated Row
  static final ExerciseModel seatedRowExercise = ExerciseModel(
    title: ExerciseTextConstants.seatedRow,
    sets: 3,
    needsWarmup: true,
    image: MediaConstants.seatedRowImage,
    video: MediaConstants.seatedRowVideo,
    description: ExerciseTextConstants.seatedRowDescription,
    steps: [
      ExerciseTextConstants.seatedRowStep1,
      ExerciseTextConstants.seatedRowStep2,
      ExerciseTextConstants.seatedRowStep3,
      ExerciseTextConstants.seatedRowStep4,
    ],
    setDataList: [
      SetModel(
          exerciseTitle: ExerciseTextConstants.seatedRow,
          previousData: "-",
          setType: "W"),
      ...List<SetModel>.generate(
        3,
        (_) => SetModel(
            exerciseTitle: ExerciseTextConstants.seatedRow,
            previousData: "-",
            setType: "D"),
      ),
    ],
  );

  // Lateral Raise
  static final ExerciseModel lateralRaiseExercise = ExerciseModel(
    title: ExerciseTextConstants.lateralRaise,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.lateralRaiseImage,
    video: MediaConstants.lateralRaiseVideo,
    description: ExerciseTextConstants.lateralRaiseDescription,
    steps: [
      ExerciseTextConstants.lateralRaiseStep1,
      ExerciseTextConstants.lateralRaiseStep2,
      ExerciseTextConstants.lateralRaiseStep3,
    ],
    setDataList: List<SetModel>.generate(
      3,
      (_) => SetModel(
          exerciseTitle: ExerciseTextConstants.lateralRaise,
          previousData: "-",
          setType: "D"),
    ),
  );

  // Tricep Extension
  static final ExerciseModel tricepExtensionExercise = ExerciseModel(
    title: ExerciseTextConstants.tricepExtension,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.tricepExtensionImage,
    video: MediaConstants.tricepExtensionVideo,
    description: ExerciseTextConstants.tricepExtensionDescription,
    steps: [
      ExerciseTextConstants.tricepExtensionStep1,
      ExerciseTextConstants.tricepExtensionStep2,
      ExerciseTextConstants.tricepExtensionStep3,
    ],
    setDataList: List<SetModel>.generate(
      3,
      (_) => SetModel(
          exerciseTitle: ExerciseTextConstants.tricepExtension,
          previousData: "-",
          setType: "D"),
    ),
  );

  // Bicep Curl
  static final ExerciseModel bicepCurlExercise = ExerciseModel(
    title: ExerciseTextConstants.bicepCurl,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.bicepCurlImage,
    video: MediaConstants.bicepCurlVideo,
    description: ExerciseTextConstants.bicepCurlDescription,
    steps: [
      ExerciseTextConstants.bicepCurlStep1,
      ExerciseTextConstants.bicepCurlStep2,
      ExerciseTextConstants.bicepCurlStep3,
    ],
    setDataList: List<SetModel>.generate(
      3,
      (_) => SetModel(
          exerciseTitle: ExerciseTextConstants.bicepCurl,
          previousData: "-",
          setType: "D"),
    ),
  );

  // Reverse Fly
  static final ExerciseModel reverseFlyExercise = ExerciseModel(
    title: ExerciseTextConstants.reverseFly,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.reverseFlyImage,
    video: MediaConstants.reverseFlyVideo,
    description: ExerciseTextConstants.reverseFlyDescription,
    steps: [
      ExerciseTextConstants.reverseFlyStep1,
      ExerciseTextConstants.reverseFlyStep2,
      ExerciseTextConstants.reverseFlyStep3,
      ExerciseTextConstants.reverseFlyStep4,
    ],
    setDataList: List<SetModel>.generate(
      3,
      (_) => SetModel(
          exerciseTitle: ExerciseTextConstants.reverseFly,
          previousData: "-",
          setType: "D"),
    ),
  );

  // Squat
  static final ExerciseModel squatExercise = ExerciseModel(
    title: ExerciseTextConstants.squat,
    sets: 4,
    needsWarmup: true,
    image: MediaConstants.squatImage,
    video: MediaConstants.squatVideo,
    description: ExerciseTextConstants.squatDescription,
    steps: [
      ExerciseTextConstants.squatStep1,
      ExerciseTextConstants.squatStep2,
      ExerciseTextConstants.squatStep3,
      ExerciseTextConstants.squatStep4,
    ],
    setDataList: [
      SetModel(
          exerciseTitle: ExerciseTextConstants.squat,
          previousData: "-",
          setType: "W"),
      ...List<SetModel>.generate(
        3,
        (_) => SetModel(
            exerciseTitle: ExerciseTextConstants.squat,
            previousData: "-",
            setType: "D"),
      ),
    ],
  );

  // Leg Press
  static final ExerciseModel legPressExercise = ExerciseModel(
    title: ExerciseTextConstants.legPress,
    sets: 3,
    needsWarmup: true,
    image: MediaConstants.legPressImage,
    video: MediaConstants.legPressVideo,
    description: ExerciseTextConstants.legPressDescription,
    steps: [
      ExerciseTextConstants.legPressStep1,
      ExerciseTextConstants.legPressStep2,
      ExerciseTextConstants.legPressStep3,
    ],
    setDataList: [
      SetModel(
          exerciseTitle: ExerciseTextConstants.legPress,
          previousData: "-",
          setType: "W"),
      ...List<SetModel>.generate(
        3,
        (_) => SetModel(
            exerciseTitle: ExerciseTextConstants.legPress,
            previousData: "-",
            setType: "D"),
      ),
    ],
  );

  // Leg Extension
  static final ExerciseModel legExtensionExercise = ExerciseModel(
    title: ExerciseTextConstants.legExtension,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.legExtensionImage,
    video: MediaConstants.legExtensionVideo,
    description: ExerciseTextConstants.legExtensionDescription,
    steps: [
      ExerciseTextConstants.legExtensionStep1,
      ExerciseTextConstants.legExtensionStep2,
      ExerciseTextConstants.legExtensionStep3,
    ],
    setDataList: List<SetModel>.generate(
      3,
      (_) => SetModel(
          exerciseTitle: ExerciseTextConstants.legExtension,
          previousData: "-",
          setType: "D"),
    ),
  );

  // Hamstring Curl
  static final ExerciseModel hamstringCurlExercise = ExerciseModel(
    title: ExerciseTextConstants.hamstringCurl,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.hamstringCurlImage,
    video: MediaConstants.hamstringCurlVideo,
    description: ExerciseTextConstants.hamstringCurlDescription,
    steps: [
      ExerciseTextConstants.hamstringCurlStep1,
      ExerciseTextConstants.hamstringCurlStep2,
      ExerciseTextConstants.hamstringCurlStep3,
    ],
    setDataList: List<SetModel>.generate(
      3,
      (_) => SetModel(
          exerciseTitle: ExerciseTextConstants.hamstringCurl,
          previousData: "-",
          setType: "D"),
    ),
  );

  // Skullcrusher
  static final ExerciseModel skullcrusherExercise = ExerciseModel(
    title: ExerciseTextConstants.skullcrusher,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.skullcrusherImage,
    video: MediaConstants.skullcrusherVideo,
    description: ExerciseTextConstants.skullcrusherDescription,
    steps: [
      ExerciseTextConstants.skullcrusherStep1,
      ExerciseTextConstants.skullcrusherStep2,
      ExerciseTextConstants.skullcrusherStep3,
    ],
    setDataList: List<SetModel>.generate(
      3,
      (_) => SetModel(
          exerciseTitle: ExerciseTextConstants.skullcrusher,
          previousData: "-",
          setType: "D"),
    ),
  );

  // Barbell Curl
  static final ExerciseModel barbellCurlExercise = ExerciseModel(
    title: ExerciseTextConstants.barbellCurl,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.barbellCurlImage,
    video: MediaConstants.barbellCurlVideo,
    description: ExerciseTextConstants.barbellCurlDescription,
    steps: [
      ExerciseTextConstants.barbellCurlStep1,
      ExerciseTextConstants.barbellCurlStep2,
      ExerciseTextConstants.barbellCurlStep3,
    ],
    setDataList: List<SetModel>.generate(
      3,
      (_) => SetModel(
          exerciseTitle: ExerciseTextConstants.barbellCurl,
          previousData: "-",
          setType: "D"),
    ),
  );

  // Leg Raise
  static final ExerciseModel legRaiseExercise = ExerciseModel(
    title: ExerciseTextConstants.legRaise,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.legRaiseImage,
    video: MediaConstants.legRaiseVideo,
    description: ExerciseTextConstants.legRaiseDescription,
    steps: [
      ExerciseTextConstants.legRaiseStep1,
      ExerciseTextConstants.legRaiseStep2,
      ExerciseTextConstants.legRaiseStep3,
    ],
    setDataList: List<SetModel>.generate(
      3,
      (_) => SetModel(
          exerciseTitle: ExerciseTextConstants.legRaise,
          previousData: "-",
          setType: "D"),
    ),
  );

  // Knee Raise
  static final ExerciseModel kneeRaiseExercise = ExerciseModel(
    title: ExerciseTextConstants.kneeRaise,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.kneeRaiseImage,
    video: MediaConstants.kneeRaiseVideo,
    description: ExerciseTextConstants.kneeRaiseDescription,
    steps: [
      ExerciseTextConstants.kneeRaiseStep1,
      ExerciseTextConstants.kneeRaiseStep2,
      ExerciseTextConstants.kneeRaiseStep3,
    ],
    setDataList: List<SetModel>.generate(
      3,
      (_) => SetModel(
          exerciseTitle: ExerciseTextConstants.kneeRaise,
          previousData: "-",
          setType: "D"),
    ),
  );

  // Russian Twist
  static final ExerciseModel russianTwistExercise = ExerciseModel(
    title: ExerciseTextConstants.russianTwist,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.russianTwistImage,
    video: MediaConstants.russianTwistVideo,
    description: ExerciseTextConstants.russianTwistDescription,
    steps: [
      ExerciseTextConstants.russianTwistStep1,
      ExerciseTextConstants.russianTwistStep2,
      ExerciseTextConstants.russianTwistStep3,
    ],
    setDataList: List<SetModel>.generate(
      3,
      (_) => SetModel(
          exerciseTitle: ExerciseTextConstants.russianTwist,
          previousData: "-",
          setType: "D"),
    ),
  );

  // Crunch
  static final ExerciseModel crunchExercise = ExerciseModel(
    title: ExerciseTextConstants.crunch,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.crunchImage,
    video: MediaConstants.crunchVideo,
    description: ExerciseTextConstants.crunchDescription,
    steps: [
      ExerciseTextConstants.crunchStep1,
      ExerciseTextConstants.crunchStep2,
      ExerciseTextConstants.crunchStep3,
    ],
    setDataList: List<SetModel>.generate(
      3,
      (_) => SetModel(
          exerciseTitle: ExerciseTextConstants.crunch,
          previousData: "-",
          setType: "D"),
    ),
  );
}

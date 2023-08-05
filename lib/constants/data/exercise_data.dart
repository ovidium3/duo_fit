import '/constants/media_constants.dart';
import '/constants/text/exercise_texts.dart';
import '../../helpers/create_set_data.dart';
import '/models/exercise_model.dart';

// A class that represents all components of each exercise
class ExerciseData {
  // Shoulder Press
  static final ExerciseModel shoulderPressExercise = ExerciseModel(
    title: ExerciseTexts.shoulderPress,
    sets: 3,
    needsWarmup: true,
    image: MediaConstants.shoulderPressImage,
    video: MediaConstants.shoulderPressVideo,
    description: ExerciseTexts.shoulderPressDescription,
    steps: [
      ExerciseTexts.shoulderPressStep1,
      ExerciseTexts.shoulderPressStep2,
      ExerciseTexts.shoulderPressStep3,
    ],
    setDataList: ExerciseData().createSetData(
      3,
      ExerciseTexts.shoulderPress,
      true,
    ),
  );

  // Pull Up
  static final ExerciseModel pullUpExercise = ExerciseModel(
    title: ExerciseTexts.pullUp,
    sets: 3,
    needsWarmup: true,
    image: MediaConstants.pullUpImage,
    video: MediaConstants.pullUpVideo,
    description: ExerciseTexts.pullUpDescription,
    steps: [
      ExerciseTexts.pullUpStep1,
      ExerciseTexts.pullUpStep2,
      ExerciseTexts.pullUpStep3,
    ],
    setDataList: ExerciseData().createSetData(
      3,
      ExerciseTexts.pullUp,
      true,
    ),
  );

  // Incline Bench
  static final ExerciseModel inclineBenchExercise = ExerciseModel(
    title: ExerciseTexts.inclineBench,
    sets: 3,
    needsWarmup: true,
    image: MediaConstants.inclineBenchImage,
    video: MediaConstants.inclineBenchVideo,
    description: ExerciseTexts.inclineBenchDescription,
    steps: [
      ExerciseTexts.inclineBenchStep1,
      ExerciseTexts.inclineBenchStep2,
      ExerciseTexts.inclineBenchStep3,
    ],
    setDataList: ExerciseData().createSetData(
      3,
      ExerciseTexts.inclineBench,
      true,
    ),
  );

  // Seated Row
  static final ExerciseModel seatedRowExercise = ExerciseModel(
    title: ExerciseTexts.seatedRow,
    sets: 3,
    needsWarmup: true,
    image: MediaConstants.seatedRowImage,
    video: MediaConstants.seatedRowVideo,
    description: ExerciseTexts.seatedRowDescription,
    steps: [
      ExerciseTexts.seatedRowStep1,
      ExerciseTexts.seatedRowStep2,
      ExerciseTexts.seatedRowStep3,
      ExerciseTexts.seatedRowStep4,
    ],
    setDataList: ExerciseData().createSetData(
      3,
      ExerciseTexts.seatedRow,
      true,
    ),
  );

  // Lateral Raise
  static final ExerciseModel lateralRaiseExercise = ExerciseModel(
    title: ExerciseTexts.lateralRaise,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.lateralRaiseImage,
    video: MediaConstants.lateralRaiseVideo,
    description: ExerciseTexts.lateralRaiseDescription,
    steps: [
      ExerciseTexts.lateralRaiseStep1,
      ExerciseTexts.lateralRaiseStep2,
      ExerciseTexts.lateralRaiseStep3,
    ],
    setDataList: ExerciseData().createSetData(
      3,
      ExerciseTexts.lateralRaise,
    ),
  );

  // Tricep Extension
  static final ExerciseModel tricepExtensionExercise = ExerciseModel(
    title: ExerciseTexts.tricepExtension,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.tricepExtensionImage,
    video: MediaConstants.tricepExtensionVideo,
    description: ExerciseTexts.tricepExtensionDescription,
    steps: [
      ExerciseTexts.tricepExtensionStep1,
      ExerciseTexts.tricepExtensionStep2,
      ExerciseTexts.tricepExtensionStep3,
    ],
    setDataList: ExerciseData().createSetData(
      3,
      ExerciseTexts.tricepExtension,
    ),
  );

  // Bicep Curl
  static final ExerciseModel bicepCurlExercise = ExerciseModel(
    title: ExerciseTexts.bicepCurl,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.bicepCurlImage,
    video: MediaConstants.bicepCurlVideo,
    description: ExerciseTexts.bicepCurlDescription,
    steps: [
      ExerciseTexts.bicepCurlStep1,
      ExerciseTexts.bicepCurlStep2,
      ExerciseTexts.bicepCurlStep3,
    ],
    setDataList: ExerciseData().createSetData(
      3,
      ExerciseTexts.bicepCurl,
    ),
  );

  // Reverse Fly
  static final ExerciseModel reverseFlyExercise = ExerciseModel(
    title: ExerciseTexts.reverseFly,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.reverseFlyImage,
    video: MediaConstants.reverseFlyVideo,
    description: ExerciseTexts.reverseFlyDescription,
    steps: [
      ExerciseTexts.reverseFlyStep1,
      ExerciseTexts.reverseFlyStep2,
      ExerciseTexts.reverseFlyStep3,
      ExerciseTexts.reverseFlyStep4,
    ],
    setDataList: ExerciseData().createSetData(
      3,
      ExerciseTexts.reverseFly,
    ),
  );

  // Squat
  static final ExerciseModel squatExercise = ExerciseModel(
    title: ExerciseTexts.squat,
    sets: 4,
    needsWarmup: true,
    image: MediaConstants.squatImage,
    video: MediaConstants.squatVideo,
    description: ExerciseTexts.squatDescription,
    steps: [
      ExerciseTexts.squatStep1,
      ExerciseTexts.squatStep2,
      ExerciseTexts.squatStep3,
      ExerciseTexts.squatStep4,
    ],
    setDataList: ExerciseData().createSetData(
      3,
      ExerciseTexts.squat,
      true,
    ),
  );

  // Leg Press
  static final ExerciseModel legPressExercise = ExerciseModel(
    title: ExerciseTexts.legPress,
    sets: 3,
    needsWarmup: true,
    image: MediaConstants.legPressImage,
    video: MediaConstants.legPressVideo,
    description: ExerciseTexts.legPressDescription,
    steps: [
      ExerciseTexts.legPressStep1,
      ExerciseTexts.legPressStep2,
      ExerciseTexts.legPressStep3,
    ],
    setDataList: ExerciseData().createSetData(
      3,
      ExerciseTexts.legPress,
      true,
    ),
  );

  // Leg Extension
  static final ExerciseModel legExtensionExercise = ExerciseModel(
    title: ExerciseTexts.legExtension,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.legExtensionImage,
    video: MediaConstants.legExtensionVideo,
    description: ExerciseTexts.legExtensionDescription,
    steps: [
      ExerciseTexts.legExtensionStep1,
      ExerciseTexts.legExtensionStep2,
      ExerciseTexts.legExtensionStep3,
    ],
    setDataList: ExerciseData().createSetData(
      3,
      ExerciseTexts.legExtension,
    ),
  );

  // Hamstring Curl
  static final ExerciseModel hamstringCurlExercise = ExerciseModel(
    title: ExerciseTexts.hamstringCurl,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.hamstringCurlImage,
    video: MediaConstants.hamstringCurlVideo,
    description: ExerciseTexts.hamstringCurlDescription,
    steps: [
      ExerciseTexts.hamstringCurlStep1,
      ExerciseTexts.hamstringCurlStep2,
      ExerciseTexts.hamstringCurlStep3,
    ],
    setDataList: ExerciseData().createSetData(
      3,
      ExerciseTexts.hamstringCurl,
    ),
  );

  // Skullcrusher
  static final ExerciseModel skullcrusherExercise = ExerciseModel(
    title: ExerciseTexts.skullcrusher,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.skullcrusherImage,
    video: MediaConstants.skullcrusherVideo,
    description: ExerciseTexts.skullcrusherDescription,
    steps: [
      ExerciseTexts.skullcrusherStep1,
      ExerciseTexts.skullcrusherStep2,
      ExerciseTexts.skullcrusherStep3,
    ],
    setDataList: ExerciseData().createSetData(
      3,
      ExerciseTexts.skullcrusher,
    ),
  );

  // Barbell Curl
  static final ExerciseModel barbellCurlExercise = ExerciseModel(
    title: ExerciseTexts.barbellCurl,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.barbellCurlImage,
    video: MediaConstants.barbellCurlVideo,
    description: ExerciseTexts.barbellCurlDescription,
    steps: [
      ExerciseTexts.barbellCurlStep1,
      ExerciseTexts.barbellCurlStep2,
      ExerciseTexts.barbellCurlStep3,
    ],
    setDataList: ExerciseData().createSetData(
      3,
      ExerciseTexts.barbellCurl,
    ),
  );

  // Leg Raise
  static final ExerciseModel legRaiseExercise = ExerciseModel(
    title: ExerciseTexts.legRaise,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.legRaiseImage,
    video: MediaConstants.legRaiseVideo,
    description: ExerciseTexts.legRaiseDescription,
    steps: [
      ExerciseTexts.legRaiseStep1,
      ExerciseTexts.legRaiseStep2,
      ExerciseTexts.legRaiseStep3,
    ],
    setDataList: ExerciseData().createSetData(
      3,
      ExerciseTexts.legRaise,
    ),
  );

  // Knee Raise
  static final ExerciseModel kneeRaiseExercise = ExerciseModel(
    title: ExerciseTexts.kneeRaise,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.kneeRaiseImage,
    video: MediaConstants.kneeRaiseVideo,
    description: ExerciseTexts.kneeRaiseDescription,
    steps: [
      ExerciseTexts.kneeRaiseStep1,
      ExerciseTexts.kneeRaiseStep2,
      ExerciseTexts.kneeRaiseStep3,
    ],
    setDataList: ExerciseData().createSetData(
      3,
      ExerciseTexts.kneeRaise,
    ),
  );

  // Russian Twist
  static final ExerciseModel russianTwistExercise = ExerciseModel(
    title: ExerciseTexts.russianTwist,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.russianTwistImage,
    video: MediaConstants.russianTwistVideo,
    description: ExerciseTexts.russianTwistDescription,
    steps: [
      ExerciseTexts.russianTwistStep1,
      ExerciseTexts.russianTwistStep2,
      ExerciseTexts.russianTwistStep3,
    ],
    setDataList: ExerciseData().createSetData(
      3,
      ExerciseTexts.russianTwist,
    ),
  );

  // Crunch
  static final ExerciseModel crunchExercise = ExerciseModel(
    title: ExerciseTexts.crunch,
    sets: 3,
    needsWarmup: false,
    image: MediaConstants.crunchImage,
    video: MediaConstants.crunchVideo,
    description: ExerciseTexts.crunchDescription,
    steps: [
      ExerciseTexts.crunchStep1,
      ExerciseTexts.crunchStep2,
      ExerciseTexts.crunchStep3,
    ],
    setDataList: ExerciseData().createSetData(
      3,
      ExerciseTexts.crunch,
    ),
  );
}

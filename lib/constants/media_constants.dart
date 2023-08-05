import 'dart:math';

// Contains strings to
class MediaConstants {
  // Overlay images
  static const String absFlexOverlay = 'assets/images/abs_flex_overlay.png';
  static const String barbellOverlay = 'assets/images/barbell_overlay.png';
  static const String pullDownOverlay = 'assets/images/pull_down_overlay.png';
  static const String sidePlankOverlay = 'assets/images/side_plank_overlay.png';

  // Other images
  static const String emailVerification =
      "assets/images/email_verification.png";
  static const String noImageAvailable = "assets/images/no_image_available.png";
  static const String defaultProfile = 'assets/images/noprofile.png';

  // Workout images
  static const String upper = 'assets/icons/workouts/upper.png';
  static const String push = 'assets/icons/workouts/push.png';
  static const String pull = 'assets/icons/workouts/pull.png';
  static const String legs = 'assets/icons/workouts/legs.png';
  static const String fullBody = 'assets/icons/workouts/full_body.png';
  static const String arms = 'assets/icons/workouts/arms.png';
  static const String abs = 'assets/icons/workouts/abs.png';
  static const String shoulders = 'assets/icons/workouts/shoulders.png';

  // Exercise images
  static const String shoulderPressImage =
      'assets/images/exercises/shoulder_press.png';
  static const String pullUpImage = 'assets/images/exercises/pull_up.png';
  static const String inclineBenchImage =
      'assets/images/exercises/incline_bench.png';
  static const String seatedRowImage = 'assets/images/exercises/seated_row.png';
  static const String lateralRaiseImage =
      'assets/images/exercises/lateral_raise.png';
  static const String tricepExtensionImage =
      'assets/images/exercises/tricep_extension.png';
  static const String bicepCurlImage = 'assets/images/exercises/bicep_curl.png';
  static const String reverseFlyImage =
      'assets/images/exercises/reverse_fly.png';
  static const String squatImage = 'assets/images/exercises/squat.png';
  static const String legPressImage = 'assets/images/exercises/leg_press.png';
  static const String legExtensionImage =
      'assets/images/exercises/leg_extension';
  static const String hamstringCurlImage =
      'assets/images/exercises/hamstring_curl.png';
  static const String skullcrusherImage =
      'assets/images/exercises/skullcrusher.png';
  static const String barbellCurlImage =
      'assets/images/exercises/barbell_curl.png';
  static const String legRaiseImage = 'assets/images/exercises/leg_rase.png';
  static const String kneeRaiseImage = 'assets/images/exercises/knee_raise.png';
  static const String russianTwistImage =
      'assets/images/exercises/russian_twist.png';
  static const String crunchImage = 'assets/images/exercises/crunch.png';

  // Exercise videos
  static const String shoulderPressVideo = 'assets/videos/shoulder_press.mp4';
  static const String pullUpVideo = 'assets/videos/pull_up.mp4';
  static const String inclineBenchVideo = 'assets/videos/incline_bench.mp4';
  static const String seatedRowVideo = 'assets/videos/seated_row.mp4';
  static const String lateralRaiseVideo = 'assets/videos/lateral_raise.mp4';
  static const String tricepExtensionVideo =
      'assets/videos/tricep_extension.mp4';
  static const String bicepCurlVideo = 'assets/videos/bicep_curl.mp4';
  static const String reverseFlyVideo = 'assets/videos/reverse_fly.mp4';
  static const String squatVideo = 'assets/videos/squat.mp4';
  static const String legPressVideo = 'assets/videos/leg_press.mp4';
  static const String legExtensionVideo = 'assets/videos/leg_extension.mp4';
  static const String hamstringCurlVideo = 'assets/videos/hamstring_curl.mp4';
  static const String skullcrusherVideo = 'assets/videos/skullcrusher.mp4';
  static const String barbellCurlVideo = 'assets/videos/barbell_curl.mp4';
  static const String legRaiseVideo = 'assets/videos/leg_raise.mp4';
  static const String kneeRaiseVideo = 'assets/videos/knee_raise.mp4';
  static const String russianTwistVideo = 'assets/videos/russian_twist.mp4';
  static const String crunchVideo = 'assets/videos/crunch.mp4';

  // List of images to display on auth screens
  static const List<String> overlayImages = <String>[
    MediaConstants.absFlexOverlay,
    MediaConstants.barbellOverlay,
    MediaConstants.pullDownOverlay,
    MediaConstants.sidePlankOverlay,
  ];

  // Generate Random Image
  String randomFromAssetsList() {
    return overlayImages[Random().nextInt(overlayImages.length)];
  }
}

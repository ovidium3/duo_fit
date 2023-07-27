import 'dart:math';

class MediaConstants {
  // General Images
  static const String welcome = 'assets/images/welcomeOverlayImg.png';
  static const String getStarted = 'assets/images/GetStartedOverlay.png';
  static const String login = 'assets/images/loginOverlayImg.png';
  static const String imgVerification = "assets/images/email_verif.png";
  static const String homepageOverlay = 'assets/images/welcomePageOverlay.png';
  static const String noImgAvailable = "assets/images/No_image_available.png";
  static const String defaultProfile = 'assets/images/noprofile.png';

  // Workout Images
  static const String upper = 'assets/icons/workouts/upper.png';
  static const String push = 'assets/icons/workouts/push.png';
  static const String pull = 'assets/icons/workouts/pull.png';
  static const String legs = 'assets/icons/workouts/legs.png';
  static const String fullBody = 'assets/icons/workouts/full_body.png';
  static const String arms = 'assets/icons/workouts/arms.png';
  static const String abs = 'assets/icons/workouts/abs.png';
  static const String shoulders = 'assets/icons/workouts/shoulders.png';

  // Exercise Images
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

  // Exercise Videos
  static const String shoulderPressVideo =
      'assets/videos/exercises/shoulder_press.mp4';
  static const String pullUpVideo = 'assets/videos/exercises/pull_up.mp4';
  static const String inclineBenchVideo =
      'assets/videos/exercises/incline_bench.mp4';
  static const String seatedRowVideo = 'assets/videos/exercises/seated_row.mp4';
  static const String lateralRaiseVideo =
      'assets/videos/exercises/lateral_raise.mp4';
  static const String tricepExtensionVideo =
      'assets/videos/exercises/tricep_extension.mp4';
  static const String bicepCurlVideo = 'assets/videos/exercises/bicep_curl.mp4';
  static const String reverseFlyVideo =
      'assets/videos/exercises/reverse_fly.mp4';
  static const String squatVideo = 'assets/videos/exercises/squat.mp4';
  static const String legPressVideo = 'assets/videos/exercises/leg_press.mp4';
  static const String legExtensionVideo =
      'assets/videos/exercises/leg_extension.mp4';
  static const String hamstringCurlVideo =
      'assets/videos/exercises/hamstring_curl.mp4';
  static const String skullcrusherVideo =
      'assets/videos/exercises/skullcrusher.mp4';
  static const String barbellCurlVideo =
      'assets/videos/exercises/barbell_curl.mp4';
  static const String legRaiseVideo = 'assets/videos/exercises/leg_raise.mp4';
  static const String kneeRaiseVideo = 'assets/videos/exercises/knee_raise.mp4';
  static const String russianTwistVideo =
      'assets/videos/exercises/russian_twist.mp4';
  static const String crunchVideo = 'assets/videos/exercises/crunch.mp4';

  // Auth Image List
  static const List<String> imageList = <String>[
    MediaConstants.welcome,
    MediaConstants.getStarted,
    MediaConstants.login,
    MediaConstants.homepageOverlay,
  ];

  // Generate Random Image
  String randomFromAssetsList() {
    return imageList[Random().nextInt(imageList.length)];
  }
}

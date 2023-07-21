import 'dart:math';

class ImgSrc {
  ImgSrc();

  List<String> imgList = <String>[
    ImgSrc.welcome,
    ImgSrc.getStarted,
    ImgSrc.login,
    ImgSrc.homepageOverlay,
  ];

  static String welcome = 'assets/images/welcomeOverlayImg.png';
  static String getStarted = 'assets/images/GetStartedOverlay.png';
  static String login = 'assets/images/loginOverlayImg.png';
  static String primaryLanguage = "assets/images/en.png";
  static String secondaryLanguage = "assets/images/fr.png";
  static String imgVerification = "assets/images/email_verif.png";
  static String homepageOverlay = 'assets/images/welcomePageOverlay.png';

  static String noImgAvailable = "assets/images/No_image_available.png";

  String randomFromAssetsList() {
    return imgList[Random().nextInt(imgList.length)];
  }
}

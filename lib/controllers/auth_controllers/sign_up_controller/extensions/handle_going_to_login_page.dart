import 'package:get/get.dart';

import '../../../../screens/auth/login_page.dart';
import '../sign_up_controller.dart';

extension HandleGoingToLoginPageExtension on SignUpController {
  void handleGoingToLoginPage() {
    Get.previousRoute == "/getStarted" ? Get.to(LoginPage()) : Get.back();
  }
}

import 'package:get/get.dart';

import '/controllers/auth_controllers/email_verification_controller.dart';

class EmailVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EmailVerificationController>(EmailVerificationController());
  }
}

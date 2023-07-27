import 'package:get/get.dart';

import '../controllers/auth/email_verification_controller.dart';

class EmailVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EmailVerificationController>(EmailVerificationController());
  }
}

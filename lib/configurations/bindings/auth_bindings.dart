import 'package:get/get.dart';

import '/controllers/auth/email_verification_controller.dart';
import '/controllers/auth/forgot_password_controller.dart';
import '../../controllers/auth/login_controller.dart';
import '../../controllers/auth/sign_up_controller.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<SignUpController>(SignUpController());
  }
}

class EmailVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EmailVerificationController>(EmailVerificationController());
  }
}

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ForgotPasswordController>(ForgotPasswordController());
  }
}

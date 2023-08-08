import 'package:get/get.dart';

import '/controllers/auth/email_verification_controller.dart';
import '/controllers/auth/forgot_password_controller.dart';
import '/controllers/auth/login_controller.dart';
import '/controllers/auth/sign_up_controller.dart';
import '/controllers/get_started/get_started_controller.dart';

// Controller used for get started page
class GetStartedBinding implements Bindings {
  @override
  void dependencies() {
    // Use lazy put to reduce startup time, as it may not get used
    Get.lazyPut<GetStartedController>(() => GetStartedController());
  }
}

// Controllers used for login and sign up pages
class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<SignUpController>(SignUpController());
  }
}

// Controller used for email verification page
class EmailVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EmailVerificationController>(EmailVerificationController());
  }
}

// Controller used for forgot password page
class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    // Use lazy put to reduce startup time, as it may not get used
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {}
}

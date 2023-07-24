import 'package:get/get.dart';

import '/controllers/auth_controllers/login_controller/login_controller.dart';
import '/controllers/auth_controllers/sign_up_controller/sign_up_controller.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<SignUpController>(SignUpController());
  }
}

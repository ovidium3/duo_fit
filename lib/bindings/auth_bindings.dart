import 'package:get/get.dart';

import '../controllers/authControllers/login_controller/login_controller.dart';
import '../controllers/authControllers/sign_up_controller/sign_up_controller.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<SignUpController>(SignUpController());
  }
}

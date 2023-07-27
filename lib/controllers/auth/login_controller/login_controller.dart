import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '/controllers/dialog_controller.dart';

class LoginController extends GetxController {
  late TextEditingController loginEmailController, loginPasswordController;

  final DialogController dialogController = Get.find();

// TODO: implement show/hide for the password field
//   // showPassword(bool obscureText) {
//   //   obscureText = false;
//   //   update();
//   // }

  @override
  void onInit() {
    _initializeTextEditingControllers();
    super.onInit();
  }

  @override
  void onClose() {
    _disposeTextEditingControllers();
    super.onClose();
  }

  void _disposeTextEditingControllers() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
  }

  void _initializeTextEditingControllers() {
    loginEmailController = TextEditingController();
    loginPasswordController = TextEditingController();
  }
}

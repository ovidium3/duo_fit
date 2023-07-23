import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:duo_fit/controllers/auth_controllers/login_controller/extensions/text.dart';

import '../../dialog_controller.dart';

class LoginController extends GetxController {
  late TextEditingController loginEmailController, loginPasswordController;

  DialogsAndLoadingController dialogsAndLoadingController = Get.find();

// TODO: implement show/hide for the password field
//   // showPassword(bool obscureText) {
//   //   obscureText = false;
//   //   update();
//   // }

  @override
  void onInit() {
    initializeTextEditingControllers();
    super.onInit();
  }

  @override
  void onClose() {
    disposeTextEditingControllers();
    super.onClose();
  }
}

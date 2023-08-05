import 'package:get/get.dart';

import '/controllers/auth_state_controller.dart';
import '/controllers/dialog_controller.dart';

// Controllers used for general app state management / features
class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthStateController>(AuthStateController());
    Get.put<DialogController>(DialogController());
  }
}

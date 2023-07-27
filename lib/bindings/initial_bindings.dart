import 'package:get/get.dart';

import '../controllers/auth/auth_state_controller.dart';
import '/controllers/dialog_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthStateController>(AuthStateController());
    Get.put<DialogController>(DialogController());
  }
}

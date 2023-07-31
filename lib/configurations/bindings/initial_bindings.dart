import 'package:get/get.dart';

import '../../controllers/auth_state_controller.dart';
import '/controllers/dialog_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthStateController>(AuthStateController());
    Get.put<DialogController>(DialogController());
  }
}

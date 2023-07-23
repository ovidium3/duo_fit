import 'package:get/get.dart';

import '../controllers/auth_controllers/newAuthStateChangeListener.dart';
import '../controllers/dialog_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // Dependency injections
    Get.put<NewAuthStateChangeListener>(NewAuthStateChangeListener());
    Get.put<DialogController>(DialogController());
  }
}

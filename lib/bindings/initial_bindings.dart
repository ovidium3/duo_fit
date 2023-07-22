import 'package:get/get.dart';
import 'package:duo_fit/controllers/functionsController.dart';

import '../controllers/authControllers/newAuthStateChangeListener.dart';
import '../controllers/functionsController/dialogsAndLoadingController.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // inject the auth changes listener controller
    Get.put<NewAuthStateChangeListener>(NewAuthStateChangeListener());
    Get.put<FunctionsController>(FunctionsController(), permanent: true);
    Get.put<DialogsAndLoadingController>(DialogsAndLoadingController());
  }
}

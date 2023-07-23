import 'package:get/get.dart';

import '../controllers/get_started_controllers/get_started_card_controller.dart';
import '../controllers/get_started_controllers/get_started_controller.dart';

class GetStartedBinding implements Bindings {
  @override
  void dependencies() {
    // Dependency injections
    Get.lazyPut<GetStartedController>(() => GetStartedController());
    //Get.lazyPut<GetStartedCardController>(() => GetStartedCardController());
  }
}

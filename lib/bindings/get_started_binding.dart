import 'package:get/get.dart';

import '../controllers/get_started_controller/get_started_card_controller.dart';
import '../controllers/get_started_controller/get_started_controller.dart';

class GetStartedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetStartedController>(() => GetStartedController());
  }
}

import 'package:get/get.dart';

import '/controllers/get_started/get_started_controller.dart';

// Controller used for get started page
class GetStartedBinding implements Bindings {
  @override
  void dependencies() {
    // Use lazy put to reduce startup time, as it may not get used
    Get.lazyPut<GetStartedController>(() => GetStartedController());
  }
}

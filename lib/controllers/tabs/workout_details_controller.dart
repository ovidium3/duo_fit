import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/data/general_data.dart';

class DetailsTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Tab controller
  late TabController detailsTabController;

  @override
  void onInit() {
    // Initialize tab controller
    detailsTabController = TabController(
        vsync: this, length: DataConstants.workoutDetailsTabs.length);
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose tab controller
    detailsTabController.dispose();
    super.onClose();
  }
}

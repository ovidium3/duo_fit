import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/data/general_data.dart';

// Controller for workout tab navigation
class WorkoutTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Tab controller
  late TabController workoutTabController;

  @override
  void onInit() {
    // Initialize tab controller
    workoutTabController =
        TabController(vsync: this, length: DataConstants.workoutTabs.length);
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose tab controller
    workoutTabController.dispose();
    super.onClose();
  }
}

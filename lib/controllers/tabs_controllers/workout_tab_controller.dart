import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTabBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Tab controller
  late TabController workOutTabController;

  // Tabs to show
  final List<Tab> workoutTabs = <Tab>[
    const Tab(text: 'Popular'),
    const Tab(text: 'Upper Body'),
    const Tab(text: 'Lower Body'),
    const Tab(text: 'Full Body'),
    const Tab(text: 'Extras'),
  ];

  @override
  void onInit() {
    // Initialize tab controller
    workOutTabController =
        TabController(vsync: this, length: workoutTabs.length);
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose tab controller
    workOutTabController.dispose();
    super.onClose();
  }
}

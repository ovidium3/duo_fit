import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTabBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // TabController
  late TabController workOutTabController;

  // Tabs to show
  final List<Tab> workOutTabs = <Tab>[
    const Tab(text: 'Popular'),
    const Tab(text: 'Upper Body'),
    const Tab(text: 'Lower Body'),
    const Tab(text: 'Full Body'),
    const Tab(text: 'Extras'),
  ];

  @override
  void onInit() {
    workOutTabController =
        TabController(vsync: this, length: workOutTabs.length);
    super.onInit();
  }

  @override
  void onClose() {
    // dispose
    workOutTabController.dispose();
    super.onClose();
  }
}

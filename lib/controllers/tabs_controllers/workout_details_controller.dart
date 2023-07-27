import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Tab controller
  late TabController detailsTabController;

  // Tabs to show
  final List<Tab> detailsTabs = <Tab>[
    const Tab(text: "Description"),
    const Tab(text: "Reviews"),
    const Tab(text: 'Comments'),
  ];

  @override
  void onInit() {
    // Initialize tab controller
    detailsTabController =
        TabController(vsync: this, length: detailsTabs.length);
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose tab controller
    detailsTabController.dispose();
    super.onClose();
  }
}

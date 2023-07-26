import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dialog_controller.dart';

class SignUpController extends GetxController {
  // Dependency injection
  final DialogController dialogController = Get.find();

  // Input controllers
  late TextEditingController signUpUserController,
      signUpEmailController,
      signUpPasswordController;

  // Get current time to mark the program's start date
  FieldValue thisMomentTime = FieldValue.serverTimestamp();

  @override
  void onInit() {
    // Input controller creation
    signUpUserController = TextEditingController();
    signUpEmailController = TextEditingController();
    signUpPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // Input controller disposal
    signUpEmailController.dispose();
    signUpPasswordController.dispose();
    signUpUserController.dispose();
    super.onClose();
  }
}

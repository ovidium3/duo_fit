import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duo_fit/controllers/auth_controllers/sign_up_controller/extensions/text_editing_controller_lifecycle.dart';
import '../../dialog_controller.dart';

class SignUpController extends GetxController {
  late TextEditingController signUpUserController,
      signUpEmailController,
      signUpPasswordController;
  final DialogController dialogsAndLoadingController = Get.find();
  // Get moment time (in this case, get more info about user)
  FieldValue thisMomentTime = FieldValue.serverTimestamp();

  @override
  void onInit() {
    initializeTextEditingControllers();
    super.onInit();
  }

  @override
  void onClose() {
    disposeTextEditingControllers();
    super.onClose();
  }
}

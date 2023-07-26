import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../constants/text/general_texts.dart';
import '/controllers/dialog_controller.dart';
import '/helpers/extension/auth_validation_extension.dart';
import '/helpers/extension/auth_errors_extension.dart';

class ForgotPasswordController extends GetxController {
  // Dependency injection
  DialogController dialogController = Get.put(DialogController());

  // Input controller
  late TextEditingController recoveryEmailController;

  // Recover password method
  recoverPassword(String email) async {
    if (email.isValidEmail) {
      try {
        dialogController.showLoading();
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        // Pop loading and show success dialog
        Get.back();
        dialogController.showSuccess(TextConstants.emailVerifSentText);
      } on FirebaseAuthException catch (e) {
        // Pop loading and show error message
        Get.back();
        handleAuthErrors(e);
      } catch (e) {
        // Show other error message, shouldn't hit though
        dialogController.showError(e.toString());
      }
    } else if (email == "") {
      dialogController.showError(TextConstants.enterEmail);
    } else if (!email.isValidEmail) {
      dialogController.showError(TextConstants.enterValidEmail);
    }
  }

  @override
  void onInit() {
    // Input controller creation
    recoveryEmailController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // Input controller disposal
    recoveryEmailController.dispose();
    super.onClose();
  }
}

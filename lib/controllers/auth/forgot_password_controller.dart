import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '/constants/text/dialog_texts.dart';
import '/controllers/dialog_controller.dart';
import '/helpers/auth_validation.dart';
import '/helpers/handle_errors.dart';
import '/screens/auth/login_page.dart';

// Controller that handles password reset requests
class ForgotPasswordController extends GetxController {
  // Dependency injection
  DialogController dialogController = Get.find();

  // Input controller
  late TextEditingController recoveryEmailController;

  // Firebase auth instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Recover password method
  recoverPassword(String userEmail) async {
    if (userEmail.isValidEmail) {
      dialogController.showLoading();

      try {
        // Send reset password email, navigate to login page, show success dialog
        await auth.sendPasswordResetEmail(email: userEmail);
        Get.to(LoginPage());
        dialogController.showSuccess(DialogTexts.passwordResetEmailSent);
      } on FirebaseAuthException catch (e) {
        // Pop loading and show error message
        Get.back();
        handleAuthErrors(e);
      } catch (e) {
        // Show other error message, shouldn't hit though
        dialogController.showError(e as String);
      }
    } else {
      // Handle validation errors
      handleValidationErrors(email: userEmail);
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

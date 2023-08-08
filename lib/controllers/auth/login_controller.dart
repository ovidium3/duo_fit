import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '/controllers/dialog_controller.dart';
import '/helpers/auth_validation.dart';
import '/helpers/handle_errors.dart';

// Controller that handles logging in to the app
class LoginController extends GetxController {
  // Dependency injection
  final DialogController dialogController = Get.find();

  // Input controllers
  late TextEditingController loginEmailController, loginPasswordController;

  Future<void> loginToAccount(String loginEmail, String loginPassword) async {
    // Check first if both are valid to login directly
    if (loginEmail.isValidEmail && loginPassword.isValidPassword) {
      dialogController.showLoading();

      try {
        // Sign in user
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginEmail,
          password: loginPassword,
        );
      } on FirebaseAuthException catch (e) {
        // Pop loading and handle auth error
        Get.back();
        handleAuthErrors(e);
      } catch (e) {
        // Pop loading and show other error
        Get.back();
        dialogController.showError(e as String);
      }
    } else {
      // Handle validation errors
      handleValidationErrors(email: loginEmail, password: loginPassword);
    }
  }

  @override
  void onInit() {
    // Input controller creation
    loginEmailController = TextEditingController();
    loginPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // Input controller disposal
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.onClose();
  }
}

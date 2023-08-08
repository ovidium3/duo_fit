import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '/constants/text/dialog_texts.dart';
import '/controllers/dialog_controller.dart';

import 'auth_validation.dart';

// Extension on GetX controllers for handling common validation and auth errors
extension HandleErrors on GetxController {
  void handleAuthErrors(FirebaseAuthException e) {
    // Dependency injection
    DialogController dialogController = Get.find();

    // Extract error message and get error code from inside parentheses
    String specificErrorMessage = e.message!
        .substring(e.message!.indexOf('(') + 1, e.message!.indexOf(')'));
    switch (specificErrorMessage) {
      case 'auth/requires-recent-login':
        dialogController.showError(DialogTexts.requiresRecentLogin);
      case 'auth/invalid-email':
        dialogController.showError(DialogTexts.invalidEmail);
      case 'auth/user-disabled':
        dialogController.showError(DialogTexts.userDisabled);
      case 'auth/user-not-found':
        dialogController.showError(DialogTexts.userNotFound);
      case 'auth/email-already-in-use':
        dialogController.showError(DialogTexts.emailInUse);
      case 'auth/wrong-password':
        dialogController.showError(DialogTexts.wrongPassword);
      case 'auth/weak-password':
        dialogController.showError(DialogTexts.weakPassword);
      case 'auth/too-many-requests':
        dialogController.showError(DialogTexts.tooManyRequests);
      default:
        e.message ?? 'Error';
    }
  }

  void handleValidationErrors(
      {String? email, String? password, String? username}) {
    // Dependency injection
    DialogController dialogController = Get.find();

    if (email!.isEmpty) {
      dialogController.showError(DialogTexts.enterEmail);
    } else if (!email.isValidEmail) {
      dialogController.showError(DialogTexts.enterValidEmail);
    } else if (password!.isEmpty) {
      dialogController.showError(DialogTexts.enterPassword);
    } else if (!password.isValidPassword) {
      dialogController.showError(DialogTexts.enterValidPassword);
    } else if (username!.isEmpty) {
      dialogController.showError(DialogTexts.enterUsername);
    } else if (!username.isValidUsername) {
      dialogController.showError(DialogTexts.enterValidUsername);
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '/constants/text/error_texts.dart';
import '/controllers/dialog_controller.dart';

import 'auth_validation.dart';

extension HandleErrors on GetxController {
  void handleAuthErrors(FirebaseAuthException e) {
    // Dependency injection
    DialogController dialogController = Get.find();

    String specificErrorMessage = e.message!
        .substring(e.message!.indexOf('(') + 1, e.message!.indexOf(')'));
    switch (specificErrorMessage) {
      case 'auth/requires-recent-login':
        dialogController.showError(ErrorTexts.requiresRecentLogin);
      case 'auth/invalid-email':
        dialogController.showError(ErrorTexts.invalidEmail);
      case 'auth/user-disabled':
        dialogController.showError(ErrorTexts.userDisabled);
      case 'auth/user-not-found':
        dialogController.showError(ErrorTexts.userNotFound);
      case 'auth/email-already-in-use':
        dialogController.showError(ErrorTexts.emailInUse);
      case 'auth/wrong-password':
        dialogController.showError(ErrorTexts.wrongPassword);
      case 'auth/weak-password':
        dialogController.showError(ErrorTexts.weakPassword);
      case 'auth/too-many-requests':
        dialogController.showError(ErrorTexts.tooManyRequests);
      default:
        e.message ?? 'Error';
    }
  }

  void handleValidationErrors(
      {String? email, String? password, String? username}) {
    // Dependency injection
    DialogController dialogController = Get.find();

    if (email!.isEmpty) {
      dialogController.showError(ErrorTexts.enterEmail);
    } else if (!email.isValidEmail) {
      dialogController.showError(ErrorTexts.enterValidEmail);
    } else if (password!.isEmpty) {
      dialogController.showError(ErrorTexts.enterPassword);
    } else if (!password.isValidPassword) {
      dialogController.showError(ErrorTexts.enterValidPassword);
    } else if (username!.isEmpty) {
      dialogController.showError(ErrorTexts.enterUsername);
    } else if (!username.isValidUsername) {
      dialogController.showError(ErrorTexts.enterValidUsername);
    }
  }
}

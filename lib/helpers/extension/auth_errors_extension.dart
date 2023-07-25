import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '/constants/text_constants/error_text_constants.dart';
import 'package:duo_fit/controllers/dialog_controller.dart';

extension HandleAuthErrors on GetxController {
  void handleAuthErrors(FirebaseAuthException e) {
    DialogController dialogController = Get.find();
    String specificErrorMessage = e.message!
        .substring(e.message!.indexOf('(') + 1, e.message!.indexOf(')'));
    switch (specificErrorMessage) {
      case 'auth/invalid-email':
        dialogController.showError(ErrorTextConstants.invalidEmail);
      case 'auth/user-disabled':
        dialogController.showError(ErrorTextConstants.userDisabled);
      case 'auth/user-not-found':
        dialogController.showError(ErrorTextConstants.userNotFound);
      case 'auth/email-already-in-use':
        dialogController.showError(ErrorTextConstants.emailInUse);
      case 'auth/wrong-password':
        dialogController.showError(ErrorTextConstants.wrongPassword);
      case 'auth/weak-password':
        dialogController.showError(ErrorTextConstants.weakPassword);
      default:
        e.message ?? 'Error';
    }
  }
}

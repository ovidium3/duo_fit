import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../constants/text/error_texts.dart';
import 'package:duo_fit/controllers/dialog_controller.dart';

extension HandleAuthErrors on GetxController {
  void handleAuthErrors(FirebaseAuthException e) {
    DialogController dialogController = Get.find();
    String specificErrorMessage = e.message!
        .substring(e.message!.indexOf('(') + 1, e.message!.indexOf(')'));
    switch (specificErrorMessage) {
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
      default:
        e.message ?? 'Error';
    }
  }
}

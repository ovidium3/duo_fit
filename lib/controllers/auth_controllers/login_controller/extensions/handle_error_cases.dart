import 'package:duo_fit/controllers/auth_controllers/login_controller/login_controller.dart';
//import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../constants/text_constants/error_text_constants.dart';
//import '../../../../helpers/string_methods.dart';

extension ErrorHandlesExtension on LoginController {
  void handleFirebaseErrors(FirebaseAuthException e) {
    String specificErrorMessage = e.message!
        .substring(e.message!.indexOf('(') + 1, e.message!.indexOf(')'));
    switch (specificErrorMessage) {
      case 'auth/invalid-email':
        dialogsAndLoadingController.showError(ErrorTextConstants.invalidEmail);
      case 'auth/user-disabled':
        dialogsAndLoadingController.showError(ErrorTextConstants.userDisabled);
      case 'auth/user-not-found':
        dialogsAndLoadingController.showError(ErrorTextConstants.userNotFound);
      case 'auth/email-already-in-use':
        dialogsAndLoadingController.showError(ErrorTextConstants.emailInUse);
      case 'auth/wrong-password':
        dialogsAndLoadingController.showError(ErrorTextConstants.wrongPassword);
      case 'auth/weak-password':
        dialogsAndLoadingController.showError(ErrorTextConstants.weakPassword);
      default:
        e.message ?? 'Error';
    }
  }
}

import 'package:duo_fit/controllers/authControllers/login_controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../constants/text_constants/general_text_constants.dart';
import '../../../../helpers/string_methods.dart';

extension ErrorHandlesExtension on LoginController {
  void handleFirebaseErrors(FirebaseAuthException e) {
    print(e.message);
    String specificErrorMessage = e.message!
        .substring(e.message!.indexOf('(') + 1, e.message!.indexOf(')'));
    switch (specificErrorMessage) {
      case 'auth/invalid-email':
        dialogsAndLoadingController.showError("invalid email");
      case 'auth/user-disabled':
        dialogsAndLoadingController.showError("user disabled");
      case 'auth/user-not-found':
        dialogsAndLoadingController.showError(TextConstants.noUserText);
      case 'auth/email-already-in-use':
        dialogsAndLoadingController.showError("email alr in use");
      case 'auth/wrong-password':
        dialogsAndLoadingController
            .showError(capitalize(TextConstants.wrongPassword));
      case 'auth/weak-password':
        dialogsAndLoadingController.showError("weak password");
      default:
        e.message ?? 'Error';
    }
  }
}

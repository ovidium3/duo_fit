import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:duo_fit/helpers/extension/auth_errors_extension.dart';
import 'package:duo_fit/helpers/extension/auth_validation_extension.dart';

import '../../../../constants/text/general_texts.dart';
import '../login_controller.dart';

extension LoginWithAccountExtension on LoginController {
  /// Authenticate with firebase email/password method
  Future<void> loginWithAccount({
    required String email,
    required String password,
  }) async {
    // Check first if both are valid to login directly
    if (email.isValidEmail && password.isValidPassword) {
      try {
        dialogController.showLoading();
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } on FirebaseAuthException catch (e) {
        // Pop loading and show error
        Get.back();
        handleAuthErrors(e);
      }
    }

    //  Check if inputs are invalid
    if (email.isEmpty) {
      print("empty email");
      dialogController.showError(
        TextConstants.enterEmail,
      );
    } else if (!email.isValidEmail) {
      print("invalid email");
      dialogController.showError(
        TextConstants.invalidEmail,
      );
    } else if (password.isEmpty) {
      print("empty pword");
      dialogController.showError(
        TextConstants.enterPassword,
      );
    } else if (!password.isValidPassword) {
      print("invalid pword");
      dialogController.showError(
        TextConstants.passwordMustBe5AtLeast,
      );
    }
  }
}

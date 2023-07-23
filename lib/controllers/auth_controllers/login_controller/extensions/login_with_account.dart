import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:duo_fit/controllers/auth_controllers/login_controller/extensions/handle_error_cases.dart';
import 'package:duo_fit/helpers/extension/auth_validation_extension.dart';

import '../../../../constants/text_constants/general_text_constants.dart';
import '../../../../helpers/string_methods.dart';
import '../login_controller.dart';

extension LoginWithAccountExtension on LoginController {
  /// Authenticate with firebase email/password method
  Future<void> loginWithAccount({
    required String email,
    required String password,
  }) async {
    // Check first if they are valid to login directly
    if (email.isValidEmail && password.isValidPassword) {
      try {
        dialogsAndLoadingController.showLoading();

        // No need for making new instance since we use it one time
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // no need for popping the loading dialog since if it's working, the auth listener will do its work
      } on FirebaseAuthException catch (e) {
        // on error, first pop the loading dialog
        Get.back();
        handleFirebaseErrors(e);
      }
    }

    // Now, let's check if the inputs aren't valid
    if (email.isEmpty) {
      print("empty email");
      dialogsAndLoadingController.showError(
        capitalize(TextConstants.enterEmail),
      );
    } else if (!email.isValidEmail) {
      print("invalid email");
      dialogsAndLoadingController.showError(
        capitalize(TextConstants.invalidEmail),
      );
    } else if (password.isEmpty) {
      print("empty pword");
      dialogsAndLoadingController.showError(
        capitalize(TextConstants.enterPassword),
      );
    } else if (!password.isValidPassword) {
      print("invalid pword");
      dialogsAndLoadingController.showError(
        capitalize(TextConstants.passwordMustBe5AtLeast),
      );
    }
  }
}

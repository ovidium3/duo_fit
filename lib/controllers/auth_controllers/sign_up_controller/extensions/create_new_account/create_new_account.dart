import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:duo_fit/controllers/auth_controllers/sign_up_controller/extensions/create_new_account/add_user_info_to_firestore.dart';
import 'package:duo_fit/helpers/extension/auth_errors_extension.dart';
import 'package:duo_fit/helpers/extension/auth_validation_extension.dart';

import '../../../../../constants/text/general_texts.dart';
import '/helpers/string_methods.dart';
import '/screens/auth/email_verification_page.dart';
import '../../sign_up_controller.dart';

extension CreateNewAccExtension on SignUpController {
  // Create new account in firebase
  Future<void> createNewAccount({
    required String email,
    required String password,
    required String username,
  }) async {
    if (email.isValidEmail &&
        password.isValidPassword &&
        username.isAcceptedUsername) {
      try {
        dialogController.showLoading();

        // Firebase create account method, store the credential
        final UserCredential credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Add info to firestore
        addUserInformationToFirestore(
          credential: credential,
          email: email,
          username: username,
          isEmailVerified: FirebaseAuth.instance.currentUser!.emailVerified,
          uid: credential.user!.uid,
          profileImgPath: "",
        );

        // On sign up, we should verify our user email (no need to unnecessary checks)
        Get.to(() => EmailVerificationPage());
      } on FirebaseAuthException catch (e) {
        Get.back();
        handleAuthErrors(e);
      } catch (e) {
        dialogController.showError(e as String);
      }
    }

    // Now, if something isn't valid, inform user about it
    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      dialogController.showError(TextConstants.fillFields);
    } else if (!username.isAcceptedUsername) {
      dialogController.showError(TextConstants.usernameMustBe5AtLeast);
    } else if (!email.isValidEmail) {
      dialogController.showError(TextConstants.invalidEmail);
    } else if (!password.isValidPassword) {
      dialogController.showError(TextConstants.passwordMustBe5AtLeast);
    }
  }
}

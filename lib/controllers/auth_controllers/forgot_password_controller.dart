import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:duo_fit/controllers/dialog_controller.dart';
import 'package:duo_fit/constants/text_constants/general_text_constants.dart';

import '../../helpers/string_methods.dart';
import '/helpers/extension/auth_validation_extension.dart';

class ForgotPasswordController extends GetxController {
  // Dependency injection
  DialogController dialogController = Get.put(DialogController());

  // Text Editing controllers
  late TextEditingController recoveryEmailController;

  // Recover password method
  recoverPassword(String email) async {
    if (email.isValidEmail) {
      try {
        dialogController.showLoading();

        // Send request (no need to make independent instance)
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

        // On success pop the loading dialog
        Get.back();

        // Show success to user
        dialogController
            .showSuccess(capitalize(TextConstants.emailVerifSentText));

        //
      } on FirebaseAuthException catch (e) {
        // on error too, pop the loading dialog first
        Get.back();

        // Error checks (if you want to be more specific make for each error a case) on this pattern
        if (e.code == "user-not-found") {
          dialogController.showError(capitalize(TextConstants.noUserText));
        }
        // here your checks
        else {
          dialogController.showError("$e.message");
        }
      }
      // this is optional
      catch (e) {
        dialogController.showError(e.toString());
      }
    } else if (email == "") {
      dialogController.showError(capitalize(TextConstants.enterEmail));
    } else if (!email.isValidEmail) {
      dialogController.showError(capitalize(TextConstants.enterValidEmail));
    }
  }

  @override
  void onInit() {
    // Inputs controllers declarations
    recoveryEmailController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // Inputs controllers disposals
    recoveryEmailController.dispose();
    super.onClose();
  }
}

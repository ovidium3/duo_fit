import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '/constants/text/dialog_texts.dart';
import '/controllers/dialog_controller.dart';
import '/helpers/handle_errors.dart';
import '/screens/home/home_page.dart';

// Controller that handles user's email verification
class EmailVerificationController extends GetxController {
  // Dependency injection
  final DialogController dialogController = Get.find();

  // Get instance of current user
  User? user = FirebaseAuth.instance.currentUser;

  // Send verification email to user's current email
  sendVerificationEmail() async {
    dialogController.showLoading();

    try {
      // Send verification email
      if (user != null) {
        await user!.sendEmailVerification();
      }

      // Pop loading and show success
      Get.back();
      dialogController.showSuccess(DialogTexts.sent);
    } on FirebaseAuthException catch (e) {
      // Pop loading and handle auth error
      Get.back();
      handleAuthErrors(e);
    } catch (e) {
      // Pop loading and handle other errors
      Get.back();
      dialogController.showError(e as String);
    }
  }

  // Check if user verified their email
  checkEmailVerification() async {
    dialogController.showLoading();

    // Reload and check if user is verified
    await FirebaseAuth.instance.currentUser?.reload();
    bool? emailVerifiedAfterReload =
        FirebaseAuth.instance.currentUser?.emailVerified;

    if (emailVerifiedAfterReload == true) {
      // Update verification in firestore and load home page
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .update({
        'verified': emailVerifiedAfterReload,
      });
      Get.offAll(const HomePage());
    } else if (emailVerifiedAfterReload == false) {
      // Pop loading and show error
      Get.back();
      dialogController.showError(DialogTexts.verifyEmail);
    }
  }

  @override
  void onInit() async {
    // Send verification email before page loads
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();
    }
    super.onInit();
  }
}

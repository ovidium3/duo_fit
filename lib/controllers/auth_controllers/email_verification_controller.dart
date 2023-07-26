import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../constants/text/general_texts.dart';
import '/screens/home/home_page.dart';
import '../dialog_controller.dart';

class EmailVerificationController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;

  // Dependency injection
  final DialogController dialogController = Get.find();

  sendVerificationEmail() async {
    dialogController.showLoading();

    // Send verification email
    if (user != null) {
      await user!.sendEmailVerification();
    }

    // Pop loading and show success
    Get.back();
    dialogController.showSuccess(
      "Sent",
    );
  }

  checkEmailVerified() async {
    dialogController.showLoading();
    await user?.reload();
    bool? emailVerifiedAfterReload = user?.emailVerified;

    if (emailVerifiedAfterReload == true) {
      // Update verif in firestore and load home page
      await FirebaseFirestore.instance
          .collection("aboutUsers")
          .doc(user!.uid)
          .update({
        "verified": emailVerifiedAfterReload,
      });
      Get.offAll(HomePage());
    } else if (emailVerifiedAfterReload == false) {
      // Pop loading and show error
      Get.back();
      dialogController.showError(TextConstants.pleaseVerifyEmail);
    }
  }

  @override
  void onInit() async {
    // send verification email before page is loading
    await user!.sendEmailVerification();
    super.onInit();
  }
}

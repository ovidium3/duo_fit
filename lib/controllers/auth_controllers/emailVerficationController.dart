import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:duo_fit/constants/text_constants/general_text_constants.dart';

import '../../helpers/string_methods.dart';
import '../../view/screens/home/homePage.dart';
import '../dialog_controller.dart';

class EmailVerificatioController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;

  // dependency injections
  DialogsAndLoadingController dialogsAndLoadingController =
      Get.put(DialogsAndLoadingController());
  //FunctionsController controller = Get.put(FunctionsController());

  sendVerificationEmail() async {
    dialogsAndLoadingController.showLoading();

    // Send verification email
    if (user != null) {
      await user!.sendEmailVerification();
    }

    // Pop the loading
    Get.back();

    // Show success dialog
    dialogsAndLoadingController.showSuccess(
      "Sent",
    );
  }

  // Check email if it s verified by user
  checkEmailVerified() async {
    // show loading
    dialogsAndLoadingController.showLoading();

    // Reload data under the hood to re-check of validity
    await FirebaseAuth.instance.currentUser?.reload();

    // Get & store new isVerified value
    bool? emailVerifiedAfterReload =
        FirebaseAuth.instance.currentUser?.emailVerified;

    // check now
    if (emailVerifiedAfterReload == true) {
      // Updating in firestore
      await FirebaseFirestore.instance
          .collection("aboutUsers")
          .doc(user!.uid)
          .update({
        "verified": emailVerifiedAfterReload,
      });

      // Go to homepage now
      Get.offAll(HomePage());
    }

    // Check if it's false
    else if (emailVerifiedAfterReload == false) {
      // Pop loading
      Get.back();

      // Show error to user
      dialogsAndLoadingController
          .showError(capitalize(TextConstants.pleaseVerifyEmail));
    }
  }

  @override
  void onInit() async {
    // send verification email before page is loading
    await user!.sendEmailVerification();
    super.onInit();
  }
}
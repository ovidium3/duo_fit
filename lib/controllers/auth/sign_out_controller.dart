import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '/controllers/dialog_controller.dart';

class SignOutController extends GetxController {
  // Dependency injection
  DialogController dialogController = Get.find();

  // Sign out from the app
  signOut() async {
    try {
      // Show loading until signed out
      // dialogController.showConfirmWithActions(
      //     'are you sure you wanna log out', 'log out', () {});
      dialogController.showLoading();
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      // Pop loading and show error
      Get.back();
      dialogController.showError("Error: ${e.code}");
    }
  }
}

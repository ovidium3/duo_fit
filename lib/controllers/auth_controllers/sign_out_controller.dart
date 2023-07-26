import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../dialog_controller.dart';

class SignOutController extends GetxController {
  // Dependency injection
  DialogController dialogController = Get.put(DialogController());

  // Sign out from app
  signOut() async {
    try {
      // show loading until signed out
      dialogController.showLoading();
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      // go back then show error to user
      Get.back();
      dialogController.showError("Error: ${e.code}");
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../dialog_controller.dart';

class SignOutController extends GetxController {
  // Dependency injection
  DialogController dialogsAndLoadingController = Get.put(DialogController());

  // Sign out from app
  signOut() async {
    try {
      // show loading until signed out
      dialogsAndLoadingController.showLoading();
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      // go back then show error to user
      Get.back();
      dialogsAndLoadingController.showError("Error: ${e.code}");
    }
  }
}

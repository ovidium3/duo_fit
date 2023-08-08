import 'package:duo_fit/helpers/handle_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '/controllers/dialog_controller.dart';

// Controller that handles signing out from the app
class SignOutController extends GetxController {
  // Dependency injection
  DialogController dialogController = Get.find();

  // Sign out from the app
  signOut() async {
    dialogController.showLoading();
    try {
      // Sign out
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      // Pop loading and handle auth error
      Get.back();
      handleAuthErrors(e);
    } catch (e) {
      // Pop loading and show other error
      Get.back();
      dialogController.showError(e as String);
    }
  }
}

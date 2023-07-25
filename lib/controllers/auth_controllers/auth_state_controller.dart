import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '/screens/auth/email_verification_page.dart';
import '/screens/welcome/welcome_page.dart';
import '/screens/home/home_page.dart';

class AuthStateController extends GetxController {
  // An observable that can bu null
  Rxn<User?> user = Rxn<User?>(null);

  // Auth state handler
  handleTheUserState(User? user) {
    if (user == null) {
      Get.offAll(WelcomePage());
    } else {
      if (!user.emailVerified) {
        // print("user is signed in but not verified");
        Get.offAll(EmailVerificationPage());
      } else {
        // print("user is signed in");
        Get.offAll(HomePage());
      }
    }
  }

  @override
  void onReady() {
    ever(user, handleTheUserState);

    user.bindStream(FirebaseAuth.instance.authStateChanges());
    super.onReady();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '/screens/auth/email_verification_page.dart';
import '/screens/welcome/welcome_page.dart';
import '/screens/home/home_page.dart';

class AuthStateController extends GetxController {
  Rxn<User?> user = Rxn<User?>(null);

  // Auth state handler
  handleTheUserState(User? user) {
    if (user == null) {
      Get.offAll(WelcomePage());
    } else {
      if (!user.emailVerified) {
        Get.offAll(EmailVerificationPage());
      } else {
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

//import '/models/workout_model.dart';
import '/screens/auth/email_verification_page.dart';
import '/screens/get_started/welcome_page.dart';
import '/screens/home/home_page.dart';

class AuthStateController extends GetxController {
  // Nullable user object
  Rxn<User?> user = Rxn<User?>(null);

  // Firebase auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Auth state handler to direct user to correct page upon opening app
  handleUserState(User? user) {
    if (user == null) {
      // If user is null, send user to welcome page
      Get.offAll(WelcomePage());
    } else {
      if (!user.emailVerified) {
        // If user unverified, send to email verification page
        Get.offAll(EmailVerificationPage());
      } else {
        // if (!user.isInWorkout) {
        // // If user is in a workout, send to workout page
        // workout = await getUserWorkout();
        //   Get.offAll(WorkoutPage(workout: workout));
        // } else {
        // Otherwise, send user to home page
        Get.offAll(const HomePage());
        // }
      }
    }
  }

  // // Get user workout from firestore to load in workout page
  // void getUserWorkout(User? user) async {

  // }

  @override
  void onReady() {
    ever(user, handleUserState);
    user.bindStream(_auth.authStateChanges());
    super.onReady();
  }
}

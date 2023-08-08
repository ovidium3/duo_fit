import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '/models/workout_model.dart';
import '/screens/auth/email_verification_page.dart';
import '/screens/get_started/welcome_page.dart';
import '/screens/home/home_page.dart';
import '/screens/workout/workout_page.dart';

import 'workout_controller.dart';

// Controller that routes the current user (if any) based on user's state
class AuthStateController extends GetxController {
  // Dependency injection
  final WorkoutController workoutController = Get.put(WorkoutController());

  // Nullable user object
  Rxn<User?> user = Rxn<User?>(null);

  // Firebase auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Auth state handler to direct user to correct page upon opening app
  handleUserState(User? user) async {
    if (user == null) {
      print('user is null');
      // If user is null, send user to welcome page
      Get.offAll(WelcomePage());
    } else {
      print('user aint null');
      if (!user.emailVerified) {
        print('user aint verif');
        // If user is not verified, send to email verification page
        Get.offAll(EmailVerificationPage());
      } else {
        print('user verif');
        if (await workoutController.isUserInWorkout() == true) {
          // If user is in a workout, send to workout page
          WorkoutModel workout = await workoutController.getCurrentWorkout();
          Get.offAll(WorkoutPage(workout: workout));
        } else {
          // Otherwise, send user to home page
          Get.offAll(const HomePage());
        }
      }
    }
  }

  @override
  void onReady() {
    // Binds controller to user auth state changes
    ever(user, handleUserState);
    user.bindStream(_auth.authStateChanges());
    super.onReady();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dialog_controller.dart';
import '/helpers/handle_errors.dart';
import '/helpers/auth_validation.dart';

class SignUpController extends GetxController {
  // Dependency injections
  final DialogController dialogController = Get.find();

  // Input controllers
  late TextEditingController signUpUserController,
      signUpEmailController,
      signUpPasswordController;

  // Get current time to mark the program's start date
  FieldValue thisMomentTime = FieldValue.serverTimestamp();

  // Create new account in firebase
  Future<void> createNewAccount(
      String signUpEmail, String signUpPassword, String signUpUsername) async {
    // Firebase auth and firestore instances
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Check input validation
    if (signUpEmail.isValidEmail &&
        signUpPassword.isValidPassword &&
        signUpUsername.isValidUsername) {
      try {
        dialogController.showLoading();

        // Create firebase account and store credential
        final UserCredential credential =
            await auth.createUserWithEmailAndPassword(
          email: signUpEmail,
          password: signUpPassword,
        );

        // Add info to firestore
        await firestore.collection('Users').doc(credential.user!.uid).set({
          'email': signUpEmail,
          'username': signUpUsername,
          'uid': credential.user!.uid,
          'profileImagePath': '',
          'verified': auth.currentUser!.emailVerified,
          'createdAt': thisMomentTime,
        });

        // Initialize calorie log collection
        await firestore
            .collection('Users')
            .doc(credential.user!.uid)
            .collection('calorieLog')
            .doc('log')
            .set({'Start date': thisMomentTime});

        // Initialize user workouts collection
        await firestore
            .collection('Users')
            .doc(credential.user!.uid)
            .collection('userWorkouts')
            .doc('workouts')
            .set({'First workout': thisMomentTime});

        // Initialize food items collection
        await firestore
            .collection('Users')
            .doc(credential.user!.uid)
            .collection('foodItems')
            .doc('items')
            .set({
          'foods': [
            {'name': 'Protein Bar', 'calories': 200}
          ]
        });

        // Initialize user statistics collection
        await firestore
            .collection('Users')
            .doc(credential.user!.uid)
            .collection('userStatistics')
            .doc('stats')
            .set({
          'Target Calories': 2000,
          'Program Length': 12,
          'Workouts Completed': 0,
        });

        // Send user to email verification page
        Get.toNamed('/emailVerification');
      } on FirebaseAuthException catch (e) {
        // Pop loading and handle auth error
        Get.back();
        handleAuthErrors(e);
      } catch (e) {
        // Pop loading and show error
        Get.back();
        dialogController.showError(e as String);
      }
    } else {
      // Handle validation errors
      handleValidationErrors(
        email: signUpEmail,
        password: signUpPassword,
        username: signUpUsername,
      );
    }
  }

  @override
  void onInit() {
    // Input controller creation
    signUpUserController = TextEditingController();
    signUpEmailController = TextEditingController();
    signUpPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // Input controller disposal
    signUpEmailController.dispose();
    signUpPasswordController.dispose();
    signUpUserController.dispose();
    super.onClose();
  }
}

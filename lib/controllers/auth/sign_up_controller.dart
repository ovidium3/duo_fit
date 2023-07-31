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

        // doc ref
        // final userDocRef = FirebaseFirestore.instance
        //     .collection('Users')
        //     .doc(credential.user!.uid);

        // Add info to firestore
        await firestore.collection('Users').doc(credential.user!.uid).set({
          'email': signUpEmail,
          'username': signUpUsername,
          'uid': credential.user!.uid,
          'profileImagePath': '',
          'verified': auth.currentUser!.emailVerified,
          'createdAt': thisMomentTime,
          // 'calorieLog': userDocRef.collection('calorieLog'),
          // 'customWorkouts': userDocRef.collection('customWorkouts'),
          // 'foodItems': userDocRef.collection('foodItems'),
          // 'statistics': userDocRef.collection('statistics'),
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

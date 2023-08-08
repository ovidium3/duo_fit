import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '/constants/text/app_texts.dart';
import '/constants/text/dialog_texts.dart';
import '/controllers/dialog_controller.dart';
import '/helpers/auth_validation.dart';
import '/helpers/handle_errors.dart';

// Controller responsible for storing and updating user information
class UserInformationController extends GetxController {
  // Dependency injection
  DialogController dialogController = Get.find();

  // Getx state variables
  late RxString username = TextConstants.anonymousUser.obs;
  RxList userProfileStats = RxList([12, 2000, 0]);
  RxString userProfileImage = TextConstants.defaultProfileImage.obs;

  // New profile image path from firestore
  String? newImagePath;

  // Firebase instances of auth, firestore and storage
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Current instance of Firebase user
  final User? _user = FirebaseAuth.instance.currentUser;

  // ImagePicker
  ImagePicker picker = ImagePicker();

  // Formatted date for Firestore program time remaining
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  // Set username from firestore ( accept string )
  Future<void> setUsername() async {
    // Assign username from Firestore to reactive username
    username.value = await _firestore
        .collection('Users')
        .doc(_user?.uid)
        .get()
        .then((value) => value['username']);
  }

  // Set profile image in firestore
  Future<void> setProfileImagePath() async {
    // Assign new profile image path from Firestore
    newImagePath = await _firestore
        .collection('Users')
        .doc(_user?.uid)
        .get()
        .then((value) => value['profileImagePath']) as String;

    // Check if there is a difference between image paths
    bool sameImagePath = (newImagePath != userProfileImage.value);

    // Update reactive image path if there is difference and path is not null
    if (sameImagePath && newImagePath != '') {
      userProfileImage.value = newImagePath!;
    }
  }

  // Get profile statistics from Firestore
  Future<void> setProfileStats() async {
    // Get statistics document snapshot
    final snapshot = await _firestore
        .collection('Users')
        .doc(_user?.uid)
        .collection('userStatistics')
        .doc('stats')
        .get();

    if (snapshot.exists) {
      // Extract data and update list values with Firestore data
      final data = snapshot.data() as Map<String, dynamic>;
      final startDate = data['Join Date'] as String;
      DateTime start = DateTime.parse(startDate);
      DateTime today = DateTime.parse(formattedDate);
      Duration diff = today.difference(start);
      int weeksPassed = (diff.inDays ~/ 7);

      userProfileStats[0] = data['Program Length'] - weeksPassed;
      userProfileStats[1] = data['Target Calories'];
      userProfileStats[2] = data['Workouts Completed'];
    }
  }

  // Get image from camera
  Future<XFile?> getImageFromCamera() async {
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    bool isImagePicked = image != null;

    // Return image if it exists
    if (isImagePicked) {
      return image;
    } else {
      // Show error and return null
      dialogController.showError(DialogTexts.unableToGetCameraImage);
      return null;
    }
  }

  // Get image from device
  Future<XFile?> getImageFromDevice() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    bool isImgPicked = image != null;

    // Return image if it exists
    if (isImgPicked) {
      return image;
    } else {
      // Show error and return null
      dialogController.showError(DialogTexts.unableToGetDeviceImage);
      return null;
    }
  }

  // Update profile image path in firebase storage
  Future<void> updateProfile(XFile? image) async {
    bool isImagePicked = image != null;

    // Firebase storage reference
    final Reference profileImageRef =
        _storage.ref('userProfileImages/${_user?.uid}');

    late String imageDownloadURL;

    if (isImagePicked) {
      // set the file with image path
      File imgFile = File(image.path);
      dialogController.showLoading();
      try {
        // Upload image to Firebase Storage
        await profileImageRef.putFile(imgFile);

        // Get the download url of the image
        imageDownloadURL = await profileImageRef.getDownloadURL();

        // Update image url in Cloud Firestore
        await _firestore.collection('Users').doc(_user?.uid).update({
          'profileImagePath': imageDownloadURL,
        });

        // Update image in UI
        userProfileImage.value = imageDownloadURL;

        // Pop loading and show success
        Get.back();
        dialogController.showSuccess(DialogTexts.profilePictureUpdated);
      } on FirebaseException catch (e) {
        // Pop loading and show error
        Get.back();
        dialogController.showError(e as String);
      }
    } else {
      // Show error
      dialogController.showError(DialogTexts.unableToUpdateImage);
    }
  }

  // Update username in Cloud Firestore and in UI
  Future<void> updateUsername(String newUsername) async {
    if (newUsername.isValidUsername) {
      dialogController.showLoading();

      try {
        // Update username in firestore
        await _firestore.collection('Users').doc(_user?.uid).update({
          'username': newUsername,
        });

        // Pop loading, update username in UI, show success
        Get.back();
        username.value = newUsername;
        dialogController.showSuccess(DialogTexts.usernameUpdated);
      } on FirebaseAuthException catch (e) {
        // Pop loading and handle auth error
        Get.back();
        handleAuthErrors(e);
      } catch (e) {
        // Pop loading and show other error
        Get.back();
        dialogController.showError(e as String);
      }
    } else {
      // Handle validation error
      handleValidationErrors(username: newUsername);
    }
  }

  // Update login email with FirebaseAuth
  updateEmail(String newEmail) async {
    if (newEmail.isValidEmail) {
      dialogController.showLoading();

      try {
        // Update email in firebase auth
        await _user?.updateEmail(newEmail);

        // updating data in firestore
        // ! after next opening of the app it'll demand to verify new email
        await _firestore.collection('Users').doc(_user?.uid).update({
          'email': newEmail,
          'verified': _auth.currentUser!.emailVerified,
        });
        // Pop loading and show success
        Get.back();
        dialogController.showSuccess(DialogTexts.emailUpdated);
      } on FirebaseAuthException catch (e) {
        // Pop loading and handle auth error
        Get.back();
        handleAuthErrors(e);
      } catch (e) {
        // Pop loading and show other error
        Get.back();
        dialogController.showError(e.toString());
      }
    } else {
      // Handle validation error
      handleValidationErrors(email: newEmail);
    }
  }

  // Update password with FirebaseAuth and firestore
  updatePassword(String newPassword) async {
    dialogController.showLoading();
    try {
      // Update password in firebase auth and firestore
      await _user?.updatePassword(newPassword);
      await _firestore
          .collection('Users')
          .doc(_user?.uid)
          .update({'password': newPassword});

      // Pop loading and show success
      Get.back();
      dialogController.showSuccess(DialogTexts.passwordUpdated);
    } on FirebaseAuthException catch (e) {
      // Pop loading and handle auth errors
      Get.back();
      handleAuthErrors(e);
    } catch (e) {
      // Catch any other errors, shouldn't hit though
      Get.back();
      dialogController.showError(e as String);
    }
  }

  // Delete user in Firestore and Auth
  deleteUser() async {
    dialogController.showLoading();

    try {
      // Operation to catch sensitive auth errors like requires recent login
      // If password update goes thru, account gets deleted too so doesnt matter
      await _user?.updatePassword('Randomjunk');

      // Safely delete user from firestore then firebase auth **order matters**
      await _firestore.collection('Users').doc(_user?.uid).delete();
      await _user?.delete();

      // Pop loading and show success
      Get.back();
      dialogController.showSuccess(DialogTexts.accountDeleted);
    } on FirebaseAuthException catch (e) {
      // Pop loading and show error
      Get.back();
      handleAuthErrors(e);
    } catch (e) {
      // Show error, shouldn't hit though
      dialogController.showError(e as String);
    }
  }

  @override
  void onInit() {
    // Set username and profile path to load home page properly
    setUsername();
    setProfileImagePath();
    setProfileStats();
    super.onInit();
  }
}

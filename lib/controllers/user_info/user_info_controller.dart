import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '/constants/text/error_texts.dart';
import '/constants/text/general_texts.dart';
import '../dialog_controller.dart';
import '/helpers/auth_validation.dart';
import '/helpers/handle_errors.dart';

class UserInformationController extends GetxController {
  // Dependency injection
  DialogController dialogController = Get.find();

  // Temporary username
  late RxString username = "Anonym user".obs;

  // Default profile image url, works only on iOS afaik for some reason
  RxString userProfileImage =
      "https://www.pngall.com/wp-content/uploads/12/Avatar-Profile.png".obs;

  // profile image path from firestore
  String? newImagePath;

  // Firebase instances of auth, firestore and storage
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // ImagePicker instance
  ImagePicker picker = ImagePicker();

  // Set username from firestore ( accept string )
  void setUsername() async {
    // Assign getted username from firestore to username variable
    username.value = await _firestore
        .collection('Users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) => value["username"]);
  }

  // Set profile image in firestore
  Future<void> setProfileImagePath() async {
    // Set the getted profile img path from firestore to newGettedPath variable
    newImagePath = await _firestore
        .collection('Users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) => value["profileImagePath"]) as String;

    // Checks if there is a difference between image paths
    bool sameImagePath = (newImagePath != userProfileImage.value);

    // Update image path if there is difference
    if (sameImagePath && newImagePath != "") {
      userProfileImage.value = newImagePath!;
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
      dialogController.showError(ErrorTexts.unableToGetCameraImage);
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
      dialogController.showError(ErrorTexts.unableToGetDeviceImage);
      return null;
    }
  }

  // Update profile image path in firebase storage
  Future<void> updateProfile(XFile? image) async {
    bool isImagePicked = image != null;

    // Firebase storage reference
    final Reference userProfileImgReference =
        _storage.ref('usersProfileImgs/${_auth.currentUser!.uid}');

    late String imageDownloadURL;

    if (isImagePicked) {
      // set the file with image path
      File imgFile = File(image.path);
      dialogController.showLoading();
      try {
        // Upload image to Firebase Storage
        await userProfileImgReference.putFile(imgFile);

        // Get the download url of the image
        imageDownloadURL = await userProfileImgReference.getDownloadURL();

        // Update image url in Cloud Firestore
        await _firestore
            .collection('Users')
            .doc(_auth.currentUser!.uid)
            .update({
          'profileImagePath': imageDownloadURL,
        });

        // Update image in UI
        userProfileImage.value = imageDownloadURL;

        // Pop loading and show success
        Get.back();
        dialogController.showSuccess(TextConstants.profilePictureUpdated);
      } on FirebaseException catch (e) {
        // Pop loading and show error
        Get.back();
        dialogController.showError(e as String);
      }
    } else {
      // Show error
      dialogController.showError(ErrorTexts.unableToUpdateImage);
    }
  }

  // Update username in Cloud Firestore and in UI
  Future<void> updateUsername(String newUsername) async {
    if (newUsername.isValidUsername) {
      dialogController.showLoading();

      try {
        // Update username in firestore
        await _firestore
            .collection('Users')
            .doc(_auth.currentUser!.uid)
            .update({
          "username": newUsername,
        });

        // Pop loading, update username in UI, show success
        Get.back();
        username.value = newUsername;
        dialogController.showSuccess(TextConstants.usernameUpdated);
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
        await _auth.currentUser!.updateEmail(newEmail);

        // updating data in firestore
        // ! after next opening of the app it'll demand to verify new email
        await _firestore
            .collection('Users')
            .doc(_auth.currentUser!.uid)
            .update({
          "email": newEmail,
          "verified": _auth.currentUser!.emailVerified,
        });
        // Pop loading and show success
        Get.back();
        dialogController.showSuccess(TextConstants.emailUpdated);
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
      await _auth.currentUser!.updatePassword(newPassword);
      await _firestore
          .collection('Users')
          .doc(_auth.currentUser!.uid)
          .update({"password": newPassword});

      // Pop loading and show success
      Get.back();
      dialogController.showSuccess(TextConstants.passwordUpdated);
    } on FirebaseAuthException catch (e) {
      // Pop loading and handle auth errors
      Get.back();
      handleAuthErrors(e);
    } catch (e) {
      Get.back();
      dialogController.showError(e as String);
    }
  }

  // Delete user
  deleteUser() async {
    dialogController.showLoading();

    try {
      // Operation to catch sensitive auth errors like requires recent login
      await updateUsername(username.value);

      // Safely delete user from firestore then firebase auth **order matters**
      await _firestore.collection('Users').doc(_auth.currentUser?.uid).delete();
      await _auth.currentUser?.delete();

      // Pop loading and show success
      Get.back();
      dialogController.showSuccess(TextConstants.accountDeleted);
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
    super.onInit();
  }
}

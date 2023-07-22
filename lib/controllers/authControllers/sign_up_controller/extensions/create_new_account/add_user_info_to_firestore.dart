import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:duo_fit/controllers/authControllers/sign_up_controller/sign_up_controller.dart';

extension AddExtraInfoExt on SignUpController {
  /// This will add more user info to the database
  Future<void> addUserInformationToFirestore({
    required UserCredential credential,
    required String email,
    required String username,
    required String profileImgPath,
    required String uid,
    required bool isEmailVerified,
    String? password,
  }) async {
    // Add by uid
    await FirebaseFirestore.instance.collection("aboutUsers").doc(uid).set({
      "email": email,

      // there is no reason to get the password, for users privacy, don't store it in the database
      "password": password ?? "",
      "username": username,
      "profileImgPath": profileImgPath,
      "uid": credential.user!.uid,
      "verified": isEmailVerified,
      "createdAt": thisMomentTime,
    });
  }
}

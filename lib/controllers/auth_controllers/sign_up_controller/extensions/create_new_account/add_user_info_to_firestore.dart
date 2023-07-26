import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:duo_fit/controllers/auth_controllers/sign_up_controller/sign_up_controller.dart';

extension AddExtraInfoExt on SignUpController {
  /// This will add more user info to the database
  Future<void> addUserInformationToFirestore({
    required UserCredential credential,
    required String email,
    required String username,
    required String profileImgPath,
    required String uid,
    required bool isEmailVerified,
  }) async {
    // Add by uid
    await FirebaseFirestore.instance.collection("aboutUsers").doc(uid).set({
      "email": email,
      "username": username,
      "profileImgPath": profileImgPath,
      "uid": credential.user!.uid,
      "verified": isEmailVerified,
      "createdAt": thisMomentTime,
    });
  }
}

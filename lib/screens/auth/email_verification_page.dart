import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/media_constants.dart';
import '/constants/text/general_texts.dart';
import '/controllers/auth/email_verification_controller.dart';
import '/controllers/auth/sign_out_controller.dart';
import '/widgets/buttons/auth_button.dart';

// Page where user prompted to verify email upon signing up
class EmailVerificationPage extends GetView<EmailVerificationController> {
  EmailVerificationPage({super.key});

  // Dependency injection
  final SignOutController signOutController = Get.put(SignOutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.darkBlue,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              // Logout button
              ElevatedButton(
                onPressed: () {
                  signOutController.signOut();
                },
                child: const Text(TextConstants.logOut),
              ),

              // Space between logout button and email verification message
              const Spacer(),

              // Email verification message
              Container(
                decoration: BoxDecoration(
                  color: ColorConstants.overlayBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(30),
                width: double.infinity,
                child: SizedBox(
                  width: 300,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 90,
                        child: Image.asset(MediaConstants.imgVerification),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        TextConstants.emailSentText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorConstants.textWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Space between email verification message and done button
              const Spacer(),

              // Login button
              AuthButton(
                text: TextConstants.done,
                isOutlined: false,
                onPressed: () {
                  controller.checkEmailVerification();
                },
              ),

              // Space between done button and re-send button
              const SizedBox(height: 20),

              // Re-send button
              GestureDetector(
                onTap: () {
                  controller.sendVerificationEmail();
                },
                child: Text(
                  TextConstants.reSendEmailVerification,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

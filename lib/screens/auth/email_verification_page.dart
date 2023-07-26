import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controllers/auth_controllers/sign_out_controller.dart';
import '/constants/media_constants.dart';
import '/constants/text/general_texts.dart';
import '/constants/color_constants.dart';
import '/widgets/button_widgets/button.dart';
import '/controllers/auth_controllers/email_verification_controller.dart';

class EmailVerificationPage extends GetView<EmailVerificationController> {
  EmailVerificationPage({super.key});

  // Dependency injections
  // final EmailVerificationController emailVerificationController =
  //     Get.put(EmailVerificationController());
  final SignOutController signOutController = Get.put(SignOutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff131429),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                onPressed: () {
                  signOutController.signOut();
                },
                child: const Text(TextConstants.logOut),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 22, 23, 43),
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
              const Spacer(),
              CustomButton(
                  text: TextConstants.done,
                  isOutlined: false,
                  onPressed: () {
                    print("hit");
                    controller.checkEmailVerified();
                  }),
              const SizedBox(
                height: 20,
              ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

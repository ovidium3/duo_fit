import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controllers/auth/sign_up_controller.dart';
import '/constants/color_constants.dart';
import '/constants/text/app_texts.dart';
import '/helpers/show_delay_mixin.dart';
import '/widgets/background_image.dart';
import '/widgets/action_button.dart';
import '/widgets/text_field.dart';
import '/widgets/app_title.dart';
import '/widgets/title_with_description.dart';

import 'login_page.dart';

// Sign up page where user can also jump to login page
// ignore: must_be_immutable
class SignUpPage extends GetView<SignUpController> with ShowDelayMixin {
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [0.45, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  ColorConstants.backgroundColor,
                  ColorConstants.backgroundColor.withOpacity(0.05),
                ],
              ),
            ),
            width: double.infinity,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Space above app title
                      const Spacer(),

                      // App title
                      DelayedDisplay(
                        delay: showDelay(),
                        child: const AppTitle(),
                      ),

                      // Space between app title and sign up / sign up description
                      const Spacer(flex: 2),

                      // Sign up / sign up description
                      DelayedDisplay(
                        delay: showDelay(),
                        child: const TitleWithDescription(
                          title: TextConstants.signUp,
                          description: TextConstants.signUpDescription,
                        ),
                      ),

                      // Username text field
                      DelayedDisplay(
                        delay: showDelay(),
                        child: CustomTextField(
                          keyboardType: TextInputType.name,
                          controller: controller.signUpUserController,
                          label: TextConstants.username,
                        ),
                      ),

                      // Email text field
                      DelayedDisplay(
                        delay: showDelay(),
                        child: CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.signUpEmailController,
                          label: TextConstants.email,
                        ),
                      ),

                      // Password text field
                      DelayedDisplay(
                        delay: showDelay(),
                        child: CustomTextField(
                          keyboardType: TextInputType.text,
                          controller: controller.signUpPasswordController,
                          label: TextConstants.password,
                          obscureText: true,
                        ),
                      ),

                      // Space between password text field and auth buttons
                      const Spacer(),

                      // Auth buttons
                      Column(
                        children: [
                          // Sign up button
                          DelayedDisplay(
                            delay: showDelay(),
                            child: ActionButton(
                              onPressed: () {
                                controller.createNewAccount(
                                  controller.signUpEmailController.text.trim(),
                                  controller.signUpPasswordController.text
                                      .trim(),
                                  controller.signUpUserController.text.trim(),
                                );
                              },
                              text: TextConstants.signUp,
                              isOutlined: true,
                            ),
                          ),

                          // Space between sign up button and login page link
                          const SizedBox(height: 20),

                          // Login page link
                          DelayedDisplay(
                            delay: showDelay(),
                            child: GestureDetector(
                              onTap: () {
                                Get.previousRoute == '/getStarted'
                                    ? Get.to(LoginPage())
                                    : Get.back();
                              },
                              child: Text(
                                TextConstants.alreadyHaveAccount,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Bottom padding
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/text/general_texts.dart';
import '../../controllers/auth/login_controller.dart';
import '/helpers/show_delay_mixin.dart';
import '/widgets/background_image.dart';
import '../../widgets/buttons/auth_button.dart';
import '/widgets/text_field.dart';
import '../../widgets/text/app_title.dart';
import '../../widgets/text/title_with_description.dart';

import 'sign_up_page.dart';

// Login page where user can also jump to sign up page or reset password
// ignore: must_be_immutable
class LoginPage extends GetView<LoginController> with ShowDelayMixin {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const BackgroundImage(),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [0.45, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  ColorConstants.darkBlue,
                  ColorConstants.darkBlue.withOpacity(0.05),
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
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Space above app title
                      const Spacer(),

                      // App title
                      DelayedDisplay(
                        delay: showDelay(),
                        child: const AppTitle(),
                      ),

                      // Space between app title and login / login description
                      const Spacer(flex: 3),

                      // Login / login description
                      DelayedDisplay(
                        delay: showDelay(),
                        child: const TitleWithDescription(
                          title: TextConstants.login,
                          description: TextConstants.loginDescription,
                        ),
                      ),

                      // Space between login / login description and email text field
                      const SizedBox(height: 10),

                      // Email text field
                      DelayedDisplay(
                        delay: showDelay(),
                        child: CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.loginEmailController,
                          label: TextConstants.email,
                        ),
                      ),

                      // Password text field
                      DelayedDisplay(
                        delay: showDelay(),
                        child: CustomTextField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: controller.loginPasswordController,
                          label: TextConstants.password,
                          obscureText: true,
                        ),
                      ),

                      // Forgot password page link
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: DelayedDisplay(
                            delay: showDelay(),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed("/forgotPassword");
                              },
                              child: const Text(
                                TextConstants.forgotPassword,
                                style: TextStyle(
                                    color: ColorConstants.textWhite,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Space between forgot password page link and auth buttons
                      const Spacer(flex: 1),

                      // Auth buttons
                      Column(
                        children: [
                          // Login button
                          DelayedDisplay(
                            delay: showDelay(),
                            child: AuthButton(
                              onPressed: () {
                                controller.loginToAccount(
                                  controller.loginEmailController.text.trim(),
                                  controller.loginPasswordController.text
                                      .trim(),
                                );
                              },
                              text: TextConstants.login,
                              isOutlined: false,
                            ),
                          ),

                          // Space between login button and sign up button
                          const SizedBox(height: 10),

                          // Sign up button
                          DelayedDisplay(
                            delay: showDelay(),
                            child: AuthButton(
                              onPressed: () {
                                Get.to(() => SignUpPage());
                              },
                              text: TextConstants.signUp,
                              isOutlined: true,
                            ),
                          ),

                          // Bottom padding
                          const SizedBox(height: 10),
                        ],
                      )
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

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth/sign_up_controller/extensions/create_new_account.dart';
import '../../controllers/auth/sign_up_controller/sign_up_controller.dart';
import '/constants/color_constants.dart';
import '/constants/text/general_texts.dart';
import '/constants/show_delay_mixin.dart';
import '../../widgets/button_widgets/auth_button.dart';
import '../../widgets/text_widgets/app_title.dart';
import '/widgets/background_image.dart';
import '/widgets/text_field.dart';
import '/widgets/text_widgets/title_with_description.dart';
import '/screens/auth/login_page.dart';

class SignUpPage extends GetView<SignUpController> with DelayHelperMixin {
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
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: const AppTitle(),
                      ),
                      const Spacer(flex: 2),
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: const TitleWithDescription(
                          title: TextConstants.signUp,
                          description: TextConstants.signUpDescription,
                        ),
                      ),
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: CustomTextField(
                          keyboardType: TextInputType.name,
                          controller: controller.signUpUserController,
                          label: TextConstants.username,
                        ),
                      ),
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.signUpEmailController,
                          label: TextConstants.email,
                        ),
                      ),
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: CustomTextField(
                          keyboardType: TextInputType.text,
                          controller: controller.signUpPasswordController,
                          label: TextConstants.password,
                          obscureText: true,
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          DelayedDisplay(
                            delay: getDelayDuration(),
                            child: AuthButton(
                              onPressed: () {
                                controller.createNewAccount(
                                  email: controller.signUpEmailController.text
                                      .trim(),
                                  password: controller
                                      .signUpPasswordController.text
                                      .trim(),
                                  username: controller.signUpUserController.text
                                      .trim(),
                                );
                              },
                              isRounded: false,
                              text: (TextConstants.signUp),
                              isOutlined: true,
                            ),
                          ),
                          const SizedBox(height: 20),
                          DelayedDisplay(
                            delay: getDelayDuration(),
                            child: GestureDetector(
                              onTap: () {
                                Get.previousRoute == "/getStarted"
                                    ? Get.to(LoginPage())
                                    : Get.back();
                              },
                              child: Text(
                                TextConstants.alreadyHaveAnAccount,
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

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '/controllers/auth_controllers/sign_up_controller/sign_up_controller.dart';
import '/constants/show_delay_mixin.dart';
import '../../constants/text/general_texts.dart';
import '../../controllers/auth/login_controller/extensions/login_with_account.dart';
import '/widgets/background_image.dart';

import '../../controllers/auth/login_controller/login_controller.dart';
import '/constants/color_constants.dart';
import '/helpers/string_methods.dart';
import '../../widgets/button_widgets/auth_button.dart';
import '../../widgets/text_widgets/app_title.dart';
import '/widgets/text_field.dart';
import '/widgets/text_widgets/title_with_description.dart';
import 'sign_up_page.dart';
import 'forgot_password_page.dart';

class LoginPage extends GetView<LoginController> with DelayHelperMixin {
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
                      const Spacer(),
                      DelayedDisplay(
                        delay: Duration(milliseconds: delay),
                        child: const AppTitle(),
                      ),
                      const Spacer(flex: 3),
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: const TitleWithDescription(
                          title: TextConstants.login,
                          description: TextConstants.loginDescription,
                        ),
                      ),
                      const SizedBox(height: 10),
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.loginEmailController,
                          label: TextConstants.email,
                        ),
                      ),
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: CustomTextField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: controller.loginPasswordController,
                          label: TextConstants.password,
                          obscureText: true,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: DelayedDisplay(
                            delay: getDelayDuration(),
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
                      const Spacer(flex: 1),
                      Column(
                        children: [
                          DelayedDisplay(
                            delay: getDelayDuration(),
                            child: AuthButton(
                              onPressed: () {
                                controller.loginWithAccount(
                                  email: controller.loginEmailController.text
                                      .trim(),
                                  password: controller
                                      .loginPasswordController.text
                                      .trim(),
                                );
                              },
                              isRounded: false,
                              text: TextConstants.login,
                              isOutlined: false,
                            ),
                          ),
                          const SizedBox(height: 10),
                          DelayedDisplay(
                            delay: getDelayDuration(),
                            child: AuthButton(
                              onPressed: () {
                                Get.to(() => SignUpPage());
                              },
                              isRounded: false,
                              text: TextConstants.signUp,
                              isOutlined: true,
                            ),
                          ),
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

import 'package:delayed_display/delayed_display.dart';
import 'package:duo_fit/controllers/auth_controllers/sign_up_controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duo_fit/constants/show_delay_mixin.dart';
import 'package:duo_fit/constants/text_constants/general_text_constants.dart';
import 'package:duo_fit/controllers/auth_controllers/login_controller/extensions/login_with_account.dart';
import 'package:duo_fit/view/widgets/general_widgets/screen_background_image.dart';

import '../../../controllers/auth_controllers/login_controller/login_controller.dart';
import '../../../constants/color_constants.dart';
import '../../../helpers/string_methods.dart';
import '../../widgets/general_widgets/button.dart';
import '../../widgets/general_widgets/main_screen_title.dart';
import '../../widgets/general_widgets/text_field.dart';
import '../../widgets/general_widgets/titleWithDescription.dart';
import 'sign_up_page.dart';
import 'forgotPassword.dart';

class LoginPage extends GetView<LoginController> with DelayHelperMixin {
  final SignUpController signUpController = Get.put(SignUpController());
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
                  AppColors.darkBlue,
                  AppColors.darkBlue.withOpacity(0.05),
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
                        child: MainScreenTitle(
                            mainWord: TextConstants.firstMainWord,
                            secondaryWord: TextConstants.secondaryMainWord),
                      ),
                      const Spacer(flex: 3),
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: TitleWithDescription(
                          title: capitalize(TextConstants.signIn),
                          description: TextConstants.loginDescription,
                        ),
                      ),
                      const SizedBox(height: 10),
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.loginEmailController,
                          label: capitalize(TextConstants.email),
                        ),
                      ),
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: CustomTextField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: controller.loginPasswordController,
                          label: capitalize(TextConstants.password),
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
                              child: Text(
                                capitalize(
                                  TextConstants.forgotPassword,
                                ),
                                style: const TextStyle(
                                    color: Colors.white,
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
                            child: CustomButton(
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
                              text: capitalize(TextConstants.login),
                              isOutlined: false,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DelayedDisplay(
                            delay: getDelayDuration(),
                            child: CustomButton(
                              onPressed: () {
                                Get.to(() => SignUpPage());
                              },
                              isRounded: false,
                              text: capitalize(TextConstants.signUp),
                              isOutlined: true,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
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

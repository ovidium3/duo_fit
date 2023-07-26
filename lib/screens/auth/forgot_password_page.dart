import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import 'package:duo_fit/constants/text/general_texts.dart';
import '/controllers/auth_controllers/forgot_password_controller.dart';
import '/helpers/string_methods.dart';
import '/widgets/button_widgets/button.dart';
import '/widgets/text_field.dart';
import '/widgets/text_widgets/title_with_description.dart';
import '/widgets/background_image.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({super.key});

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
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DelayedDisplay(
                    delay: Duration(milliseconds: delay + 100),
                    child: const TitleWithDescription(
                      title: TextConstants.forgotPassword,
                      description: TextConstants.forgotPasswordDesccription,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DelayedDisplay(
                    delay: Duration(milliseconds: delay + 200),
                    child: CustomTextField(
                      controller: controller.recoveryEmailController,
                      keyboardType: TextInputType.emailAddress,
                      label: (TextConstants.yourEmail),
                    ),
                  ),
                  const SizedBox(height: 50),
                  DelayedDisplay(
                    delay: Duration(milliseconds: delay + 300),
                    child: CustomButton(
                      onPressed: () {
                        controller.recoverPassword(
                            controller.recoveryEmailController.text);
                      },
                      isRounded: false,
                      text: TextConstants.resetPassword,
                      isOutlined: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

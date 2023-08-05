import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/text/general_texts.dart';
import '/controllers/auth/forgot_password_controller.dart';
import '/helpers/show_delay_mixin.dart';
import '../../widgets/buttons/auth_button.dart';
import '/widgets/text_field.dart';
import '../../widgets/text/title_with_description.dart';
import '/widgets/background_image.dart';

// Page where user can reset password from login page
// ignore: must_be_immutable
class ForgotPasswordPage extends GetView<ForgotPasswordController>
    with ShowDelayMixin {
  ForgotPasswordPage({super.key});

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
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Forgot password / forgot password description
                  DelayedDisplay(
                    delay: showDelay(),
                    child: const TitleWithDescription(
                      title: TextConstants.forgotPassword,
                      description: TextConstants.forgotPasswordDesccription,
                    ),
                  ),

                  // Space between forgot password / forgot password description and email text field
                  const SizedBox(height: 10),

                  // Email text field
                  DelayedDisplay(
                    delay: showDelay(),
                    child: CustomTextField(
                      controller: controller.recoveryEmailController,
                      keyboardType: TextInputType.emailAddress,
                      label: (TextConstants.yourEmail),
                    ),
                  ),

                  // Space between email text field and reset password button
                  const SizedBox(height: 50),

                  // Reset password button
                  DelayedDisplay(
                    delay: showDelay(),
                    child: AuthButton(
                      onPressed: () {
                        controller.recoverPassword(
                            controller.recoveryEmailController.text);
                      },
                      isRounded: false,
                      text: TextConstants.resetPassword,
                      isOutlined: true,
                    ),
                  ),

                  // Bottom padding
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

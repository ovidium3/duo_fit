import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duo_fit/constants/color_constants.dart';
import 'package:duo_fit/constants/image_path_constants.dart';
import 'package:duo_fit/constants/text_constants/general_text_constants.dart';
import '../../../controllers/auth_controllers/forgotPasswordController.dart';
import '../../../helpers/string_methods.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';
import '../../widgets/titleWithDescription.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  // Dependency injection
  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              ImgSrc().randomFromAssetsList(),
              fit: BoxFit.cover,
            ),
          ),
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
                    child: TitleWithDescription(
                      title: capitalize(TextConstants.forgotPassword),
                      description: capitalize(TextConstants
                          .forgotPasswordDesccription
                          .toLowerCase()),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DelayedDisplay(
                    delay: Duration(milliseconds: delay + 200),
                    child: CustomTextField(
                      controller:
                          forgotPasswordController.emailToRecoverPassword,
                      keyboardType: TextInputType.emailAddress,
                      label: capitalize(TextConstants.yourEmail),
                    ),
                  ),
                  const SizedBox(height: 50),
                  DelayedDisplay(
                    delay: Duration(milliseconds: delay + 300),
                    child: CustomButton(
                      onPressed: () {
                        forgotPasswordController.recoverPassword(
                            forgotPasswordController
                                .emailToRecoverPassword.text);
                      },
                      isRounded: false,
                      text: capitalize(TextConstants.resetPassword),
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

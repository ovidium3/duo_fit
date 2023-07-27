import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/media_constants.dart';
import '../../constants/text/general_texts.dart';
import '/widgets/text_widgets/title_with_description.dart';
import '/constants/show_delay_mixin.dart';
import '../../widgets/button_widgets/auth_button.dart';
import '../../widgets/text_widgets/app_title.dart';
import '/widgets/background_image.dart';

class WelcomePage extends StatelessWidget with DelayHelperMixin {
  WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundImage(),
          Container(
            color: ColorConstants.darkBlue.withOpacity(0.69),
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  // App title display
                  DelayedDisplay(
                    delay: getDelayDuration(),
                    child: const AppTitle(),
                  ),
                  const Spacer(flex: 2),

                  // welcome + description
                  DelayedDisplay(
                    delay: getDelayDuration(),
                    child: const TitleWithDescription(
                      title: TextConstants.welcome,
                      description: TextConstants.welcomeDescription,
                    ),
                  ),
                  const Spacer(flex: 2),

                  // Get started / login buttons
                  Column(
                    children: [
                      // Get started button
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: AuthButton(
                          onPressed: () {
                            Get.toNamed("/getStarted");
                          },
                          text: TextConstants.getStarted,
                          isOutlined: false,
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Login button
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: AuthButton(
                          onPressed: () {
                            Get.toNamed("/login");
                          },
                          text: TextConstants.login,
                          isOutlined: true,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

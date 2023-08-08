import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/text/app_texts.dart';
import '/helpers/show_delay_mixin.dart';
import '/widgets/background_image.dart';
import '/widgets/action_button.dart';
import '/widgets/app_title.dart';
import '/widgets/title_with_description.dart';

// The first page a new user sees upon opening the app
// ignore: must_be_immutable
class WelcomePage extends StatelessWidget with ShowDelayMixin {
  WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundImage(),
          Container(
            color: ColorConstants.backgroundColor.withOpacity(0.69),
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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

                  // Space between app title and welcome / app description
                  const Spacer(flex: 2),

                  // Welcome and app description
                  DelayedDisplay(
                    delay: showDelay(),
                    child: const TitleWithDescription(
                      title: TextConstants.welcome,
                      description: TextConstants.welcomeDescription,
                    ),
                  ),

                  // Space between welcome / app description and auth buttons
                  const Spacer(flex: 2),

                  // Auth buttons
                  Column(
                    children: [
                      // Get started button
                      DelayedDisplay(
                        delay: showDelay(),
                        child: ActionButton(
                          onPressed: () {
                            Get.toNamed('/getStarted');
                          },
                          text: TextConstants.getStarted,
                          isOutlined: false,
                        ),
                      ),

                      // Space between buttons
                      const SizedBox(height: 15),

                      // Login button
                      DelayedDisplay(
                        delay: showDelay(),
                        child: ActionButton(
                          onPressed: () {
                            Get.toNamed('/login');
                          },
                          text: TextConstants.login,
                          isOutlined: true,
                        ),
                      ),

                      // Bottom padding
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

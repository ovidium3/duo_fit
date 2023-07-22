import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duo_fit/constants/color_constants.dart';
import 'package:duo_fit/constants/image_path_constants.dart';
import 'package:duo_fit/constants/text_constants.dart';
import 'package:duo_fit/view/widgets/general_widgets/titleWithDescription.dart';
import 'package:duo_fit/view/screens/toggle%20language/chooseLanguagePage.dart';
import '../../../controllers/functionsController.dart';
import '../../../constants/show_delay_mixin.dart';
import '../../../helpers/string_methods.dart';
import '../../widgets/general_widgets/button.dart';
import '../../widgets/general_widgets/mainScreenTitle.dart';
import '../../widgets/general_widgets/screen_background_image.dart';

class WelcomePage extends GetView<FunctionsController> with DelayHelperMixin {
  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          BackgroundImage(
            backgroundImage: ImgSrc().randomFromAssetsList(),
          ),
          Container(
            color: AppColors.darkBlue.withOpacity(0.69),
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  // app title display
                  DelayedDisplay(
                    delay: getDelayDuration(),
                    child: MainScreenTitle(
                      mainWord: TextConstants.firstMainWord,
                      secondaryWord: TextConstants.secondaryMainWord,
                    ),
                  ),
                  const Spacer(flex: 2),

                  // welcome + description
                  DelayedDisplay(
                    delay: getDelayDuration(),
                    child: TitleWithDescription(
                      title: capitalize(TextConstants.welcome),
                      description: TextConstants.welcomeDescription,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),

                  // Sign up / sign in buttons
                  Column(
                    children: [
                      // Get Started button
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: CustomButton(
                          onPressed: () {
                            Get.toNamed("/getStarted");
                          },
                          text: capitalize(TextConstants.getStarted),
                          isOutlined: false,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Login Button
                      DelayedDisplay(
                        delay: getDelayDuration(),
                        child: CustomButton(
                          onPressed: () {
                            Get.toNamed("/login");
                          },
                          text: capitalize(TextConstants.login),
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

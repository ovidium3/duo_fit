import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duo_fit/controllers/functionsController.dart';
import 'package:duo_fit/constants/color_constants.dart';
import 'package:duo_fit/constants/image_path_constants.dart';
import 'package:duo_fit/constants/text_constants.dart';
import '../../../helpers/string_methods.dart';
import 'componenets/ChooseLanguageBox.dart';

class ChooseLanguagePage extends StatelessWidget {
  ChooseLanguagePage({Key? key}) : super(key: key);
  final FunctionsController controller = Get.put(FunctionsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DelayedDisplay(
              delay: Duration(milliseconds: delay + 100),
              child: Center(
                child: Text(
                  capitalize(TextConstants.chooseLanguage),
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: delay + 200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ChooseLanguageBox(
                    language: TextConstants.primaryLanguage,
                    languageImgPath: ImgSrc.primaryLanguage,
                  ),
                  ChooseLanguageBox(
                    language: TextConstants.secondaryLanguage,
                    languageImgPath: ImgSrc.secondaryLanguage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

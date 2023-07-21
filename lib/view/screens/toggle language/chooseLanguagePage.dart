import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duo_fit/controller/functionsController.dart';
import 'package:duo_fit/constants/Colors.dart';
import 'package:duo_fit/constants/images%20sources.dart';
import 'package:duo_fit/constants/text.dart';
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
                  capitalize(AppTexts.chooseLanguage),
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
                    language: AppTexts.primaryLanguage,
                    languageImgPath: ImgSrc.primaryLanguage,
                  ),
                  ChooseLanguageBox(
                    language: AppTexts.secondaryLanguage,
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

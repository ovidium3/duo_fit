import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/text/general_texts.dart';

class DialogController extends GetxController {
  // Loading dialog
  showLoading() {
    Get.defaultDialog(
      title: "",
      backgroundColor: ColorConstants.transparent,
      content: const SpinKitThreeBounce(
        color: ColorConstants.green,
        duration: Duration(seconds: 1),
      ),
    );
  }

  // Confirmation dialog
  showConfirmWithActions(
    String infoText,
    String actionButtonText,
    void Function()? function,
  ) {
    Get.defaultDialog(
        title: "",
        backgroundColor: const Color(0xff131429),
        content: Column(
          children: [
            const Icon(
              Icons.warning,
              color: ColorConstants.green,
              size: 60,
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 200,
              child: Text(
                infoText,
                style: const TextStyle(
                  color: ColorConstants.textWhite,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text(
              TextConstants.cancel,
              style: TextStyle(color: ColorConstants.textWhite),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          TextButton(
            onPressed: function,
            child: Text(
              actionButtonText,
              style: const TextStyle(color: ColorConstants.error),
            ),
          ),
        ]);
  }

  // Error dialog
  showError(String errorText) {
    Get.defaultDialog(
        title: "",
        backgroundColor: const Color(0xff131429),
        content: Column(
          children: [
            const Icon(
              Icons.error,
              color: ColorConstants.error,
              size: 60,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: Text(
                errorText,
                style: const TextStyle(
                  color: ColorConstants.textWhite,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));
  }

  // Success Dialog
  showSuccess(String successText) {
    Get.defaultDialog(
      title: "",
      backgroundColor: ColorConstants.darkBlue,
      content: Column(
        children: [
          const Icon(
            Icons.done,
            color: ColorConstants.green,
            size: 60,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 200,
            child: Text(
              successText,
              style: const TextStyle(
                color: ColorConstants.textWhite,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

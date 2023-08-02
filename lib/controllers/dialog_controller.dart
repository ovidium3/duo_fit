import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../helpers/time_service.dart';
import '/constants/color_constants.dart';
import '/constants/text/general_texts.dart';

// A controller dedicated to displaying dialogs like loading and showing errors
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
        backgroundColor: ColorConstants.darkBlue,
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
        backgroundColor: ColorConstants.darkBlue,
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

  // Timer dialog
  void showTimer() {
    final ValueNotifier<int> timerDuration = ValueNotifier(120);
    // ignore: no_leading_underscores_for_local_identifiers
    final CountDownController _controller = CountDownController();

    void skipTimer() {
      Get.back();
    }

    void addTime(int seconds) {
      var currDuration = MinutesSeconds(minutes: 0, seconds: 0);
      try {
        currDuration = MinutesSeconds(
            minutes: int.parse(_controller.getTime()!.substring(0, 2)),
            seconds: int.parse(_controller.getTime()!.substring(3)));
      } catch (e) {
        // if timer < 60 seconds
        currDuration = MinutesSeconds(
            seconds: int.parse(_controller.getTime()!), minutes: 0);
      }
      final currentDuration =
          Duration(seconds: currDuration.seconds + (currDuration.minutes * 60));
      final newDuration = currentDuration + Duration(seconds: seconds);
      if (newDuration.inSeconds >= 0 &&
          newDuration.inSeconds <= timerDuration.value) {
        _controller.restart(duration: newDuration.inSeconds);
      } else if (newDuration.inSeconds < 0) {
        _controller.restart(duration: 0);
      } else {
        _controller.restart(duration: timerDuration.value);
      }
    }

    Get.defaultDialog(
      title: '',
      backgroundColor: ColorConstants.darkBlue,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularCountDownTimer(
            width: 150,
            height: 150,
            strokeWidth: 10,
            fillColor: ColorConstants.green,
            ringColor: ColorConstants.disabled,
            duration: timerDuration.value,
            isReverse: true,
            isReverseAnimation: true,
            controller: _controller,
            textStyle: const TextStyle(
              fontSize: 36,
              color: ColorConstants.textWhite,
              fontWeight: FontWeight.bold,
            ),
            onComplete: () {
              Get.back();
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => addTime(-9),
                child: const Text('-10s'),
              ),
              ElevatedButton(
                onPressed: () => addTime(11),
                child: const Text('+10s'),
              ),
              ElevatedButton(
                onPressed: skipTimer,
                child: const Text('Skip'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/text/general_texts.dart';
import '/helpers/food_validation.dart';
import '/helpers/time_service.dart';
import '/models/food_model.dart';
import '/widgets/text_field.dart';

// A controller dedicated to displaying dialogs like loading and showing errors
class DialogController extends GetxController {
  // Displays loading animation
  showLoading() {
    Get.defaultDialog(
      title: "",
      backgroundColor: ColorConstants.transparent,
      content: const SpinKitThreeBounce(
        color: ColorConstants.primaryColor,
        duration: Duration(seconds: 1),
      ),
    );
  }

  // Confirmation dialog with an option to execute a function on confirmation
  showConfirmWithActions(
    String infoText,
    String actionButtonText,
    void Function()? function,
  ) {
    Get.defaultDialog(
      title: "",
      backgroundColor: ColorConstants.backgroundColor,
      content: Column(
        children: [
          const Icon(
            Icons.warning,
            color: ColorConstants.primaryColor,
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
      ],
    );
  }

  // Displays custom error message, mostly firebase auth errors
  showError(String errorText) {
    Get.defaultDialog(
      title: "",
      backgroundColor: ColorConstants.backgroundColor,
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
      ),
    );
  }

  // Displays custom success message
  showSuccess(String successText) {
    Get.defaultDialog(
      title: "",
      backgroundColor: ColorConstants.backgroundColor,
      content: Column(
        children: [
          const Icon(
            Icons.done,
            color: ColorConstants.primaryColor,
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

  // Edit food dialog that prompts user to choose to either add or remove a food
  void showEditFoods(
      TextEditingController foodNameController,
      TextEditingController caloriesController,
      Function() addCustomFoodItem,
      Function(FoodModel) removeCustomFoodItem,
      List<FoodModel> foods) {
    Get.defaultDialog(
      title: "Edit Foods",
      titlePadding: const EdgeInsets.only(top: 20),
      titleStyle: const TextStyle(color: ColorConstants.textWhite),
      backgroundColor: ColorConstants.backgroundColor,
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Add food button
            ElevatedButton(
              onPressed: () {
                showAddCustomFood(
                    foodNameController, caloriesController, addCustomFoodItem);
              },
              child: const Text(
                'Add Food',
                style: TextStyle(
                  color: ColorConstants.textWhite,
                ),
              ),
            ),

            // Space between add food and remove food button
            const SizedBox(height: 10),

            // Remove food button
            ElevatedButton(
              onPressed: () {
                showRemoveCustomFood(foods, removeCustomFoodItem);
              },
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(ColorConstants.iconRed),
              ),
              child: const Text(
                'Remove Food',
                style: TextStyle(
                  color: ColorConstants.textWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Displays popup prompting user to enter a new food's information
  void showAddCustomFood(TextEditingController foodNameController,
      TextEditingController caloriesController, Function() addCustomFoodItem) {
    Get.defaultDialog(
      title: 'Add a Custom Food',
      titlePadding: const EdgeInsets.only(top: 20),
      titleStyle: const TextStyle(color: ColorConstants.textWhite),
      backgroundColor: ColorConstants.backgroundColor,
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Food name input text field
            CustomTextField(
              controller: foodNameController,
              keyboardType: TextInputType.text,
              label: 'Food Name',
            ),

            // Calories input text field
            CustomTextField(
              controller: caloriesController,
              keyboardType: TextInputType.number,
              label: 'Calories',
            ),

            // Space between calories input text field and action buttons
            const SizedBox(height: 20),
          ],
        ),
      ),

      // Action buttons
      actions: [
        // Cancel button
        TextButton(
          child: const Text(
            TextConstants.cancel,
            style: TextStyle(color: ColorConstants.textWhite),
          ),
          onPressed: () {
            Get.back();
          },
        ),

        // Space between cancel button and add food button
        const SizedBox(width: 10),

        // Add food button
        TextButton(
          onPressed: () {
            if (foodNameController.text.isValidFoodName &&
                caloriesController.text.isValidCalories) {
              addCustomFoodItem();
              showSnackbar(true, foodNameController.text);
            } else {
              showError('Unable to add food');
            }

            // Clear controllers and pop dialogs
            foodNameController.clear();
            caloriesController.clear();
            Get.back();
            Get.back();
          },
          child: const Text(
            'Add Food',
            style: TextStyle(color: ColorConstants.primaryColor),
          ),
        ),
      ],
    );
  }

  // Displays snackbar message to confirm addition or removal of a food
  void showSnackbar(bool isAddFood, String foodName) {
    String descriptionText =
        isAddFood ? TextConstants.foodAdded : TextConstants.foodRemoved;
    Get.snackbar(
      'Success!',
      '$foodName $descriptionText',
      backgroundColor: ColorConstants.backgroundColor,
      colorText: ColorConstants.textWhite,
    );
  }

  // Displays popup prompting user to select which custom food(s) to delete
  void showRemoveCustomFood(
      List<FoodModel> foods, Function(FoodModel) removeCustomFoodItem) {
    Get.defaultDialog(
      title: 'Remove a Custom Food',
      titlePadding: const EdgeInsets.only(top: 20),
      titleStyle: const TextStyle(color: ColorConstants.textWhite),
      backgroundColor: ColorConstants.backgroundColor,
      content: SizedBox(
        width: 200,
        height: 250,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Custom foods list
            Expanded(
              child: ListView.builder(
                itemCount: foods.length,
                itemBuilder: (context, index) {
                  final food = foods[index];

                  // Individual food with calorie information and remove button
                  return ListTile(
                    trailing: IconButton(
                      onPressed: () {
                        showConfirmWithActions(
                          TextConstants.confirmRemoveFood,
                          TextConstants.remove,
                          () {
                            removeCustomFoodItem(food);
                            showSnackbar(false, food.name);
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                        );
                      },
                      iconSize: 14,
                      icon: const Icon(
                        Icons.remove,
                        color: ColorConstants.iconWhite,
                      ),
                    ),
                    title: Text(
                      '${food.name} (${food.calories} cal)',
                      style: const TextStyle(
                        color: ColorConstants.textWhite,
                        fontSize: 14,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        // Cancel button
        TextButton(
          child: const Text(
            TextConstants.cancel,
            style: TextStyle(color: ColorConstants.textWhite),
          ),
          onPressed: () {
            Get.back();
            Get.back();
          },
        ),
      ],
    );
  }

  // Temporary rest timer display with limited features
  void showRestTimer() {
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
      backgroundColor: ColorConstants.backgroundColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularCountDownTimer(
            width: 150,
            height: 150,
            strokeWidth: 10,
            fillColor: ColorConstants.primaryColor,
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

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/text/dialog_texts.dart';
import '/helpers/food_validation.dart';
import '/helpers/time_service.dart';
import '/models/food_model.dart';
import '/widgets/text_field.dart';

// Controller for displaying dialogs like loading and showing errors
class DialogController extends GetxController {
  // Displays loading animation
  showLoading() {
    Get.defaultDialog(
      title: '',
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
      title: '',
      backgroundColor: ColorConstants.backgroundColor,
      content: Column(
        children: [
          // Warning symbol
          const Icon(
            Icons.warning,
            color: ColorConstants.primaryColor,
            size: 60,
          ),

          // Space between warning symbol and error info text
          const SizedBox(height: 15),

          // Error info text
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
        // Cancel button
        TextButton(
          child: const Text(
            DialogTexts.cancel,
            style: TextStyle(color: ColorConstants.textWhite),
          ),
          onPressed: () {
            Get.back();
          },
        ),

        // Confirm button with function
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
      title: '',
      backgroundColor: ColorConstants.backgroundColor,
      content: Column(
        children: [
          // Error icon
          const Icon(
            Icons.error,
            color: ColorConstants.error,
            size: 60,
          ),

          // Space between error icon and error info text
          const SizedBox(height: 20),

          // Error info text
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
      title: '',
      backgroundColor: ColorConstants.backgroundColor,
      content: Column(
        children: [
          // Check mark icon
          const Icon(
            Icons.done,
            color: ColorConstants.primaryColor,
            size: 60,
          ),

          // Space between check mark icon and message text
          const SizedBox(height: 20),

          // Message text
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
      title: DialogTexts.editFoods,
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
                DialogTexts.addFood,
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
                DialogTexts.removeFood,
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
      title: DialogTexts.addCustomFood,
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
              label: DialogTexts.foodName,
            ),

            // Calories input text field
            CustomTextField(
              controller: caloriesController,
              keyboardType: TextInputType.number,
              label: DialogTexts.calories,
            ),

            // Space between calories input text field and action buttons
            const SizedBox(height: 20),
          ],
        ),
      ),
      actions: [
        // Cancel button
        TextButton(
          child: const Text(
            DialogTexts.cancel,
            style: TextStyle(color: ColorConstants.textWhite),
          ),
          onPressed: () {
            // Clear controllers and pop dialogs
            foodNameController.clear();
            caloriesController.clear();
            Get.back();
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
              // First, pop dialogs to not interfere with controller functions
              Get.back();
              Get.back();

              // Add food item and show snackbar success
              addCustomFoodItem();
              showSnackbar(true, foodNameController.text);
            } else {
              showError(DialogTexts.unableToAddFood);
            }

            // Clear controllers
            foodNameController.clear();
            caloriesController.clear();
          },
          child: const Text(
            DialogTexts.addFood,
            style: TextStyle(color: ColorConstants.primaryColor),
          ),
        ),
      ],
    );
  }

  // Displays snackbar message to confirm addition or removal of a food
  void showSnackbar(bool isAddFood, String foodName) {
    String descriptionText =
        isAddFood ? DialogTexts.foodAdded : DialogTexts.foodRemoved;
    Get.snackbar(
      DialogTexts.success,
      '$foodName $descriptionText',
      backgroundColor: ColorConstants.backgroundColor,
      colorText: ColorConstants.textWhite,
    );
  }

  // Displays popup prompting user to select which custom food(s) to delete
  void showRemoveCustomFood(
      List<FoodModel> foods, Function(FoodModel) removeCustomFoodItem) {
    Get.defaultDialog(
      title: DialogTexts.removeCustomFood,
      titlePadding: const EdgeInsets.only(top: 20),
      titleStyle: const TextStyle(color: ColorConstants.textWhite),
      backgroundColor: ColorConstants.backgroundColor,
      content: SizedBox(
        width: 250,
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
                          DialogTexts.confirmRemoveFood,
                          DialogTexts.delete,
                          () {
                            // Pop dialogs before removing food
                            Get.back();
                            Get.back();
                            Get.back();
                            removeCustomFoodItem(food);
                            showSnackbar(false, food.name);
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
            DialogTexts.cancel,
            style: TextStyle(color: ColorConstants.textWhite),
          ),
          onPressed: () {
            // Pop dialogs
            Get.back();
            Get.back();
          },
        ),
      ],
    );
  }

  // Temporary rest timer display with limited features
  void showRestTimer() {
    // Initial rest time
    final ValueNotifier<int> timerDuration = ValueNotifier(120);

    // Timer controller
    final CountDownController timerController = CountDownController();

    // Function that closes out / skips timer completely
    void skipTimer() {
      Get.back();
    }

    void addTime(int seconds) {
      // Get current time
      var currDuration = MinutesSeconds(minutes: 0, seconds: 0);
      try {
        currDuration = MinutesSeconds(
            minutes: int.parse(timerController.getTime()!.substring(0, 2)),
            seconds: int.parse(timerController.getTime()!.substring(3)));
      } catch (e) {
        // Case where timer < 60 seconds
        currDuration = MinutesSeconds(
            seconds: int.parse(timerController.getTime()!), minutes: 0);
      }

      // Update current time with new time
      final currentDuration =
          Duration(seconds: currDuration.seconds + (currDuration.minutes * 60));
      final newDuration = currentDuration + Duration(seconds: seconds);

      // Reflect changes in timer
      if (newDuration.inSeconds >= 0 &&
          newDuration.inSeconds <= timerDuration.value) {
        timerController.restart(duration: newDuration.inSeconds);
      } else if (newDuration.inSeconds < 0) {
        timerController.restart(duration: 0);
      } else {
        timerController.restart(duration: timerDuration.value);
      }
    }

    Get.defaultDialog(
      title: '',
      backgroundColor: ColorConstants.backgroundColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Timer
          CircularCountDownTimer(
            width: 150,
            height: 150,
            strokeWidth: 10,
            fillColor: ColorConstants.primaryColor,
            ringColor: ColorConstants.disabled,
            duration: timerDuration.value,
            isReverse: true,
            isReverseAnimation: true,
            controller: timerController,
            textStyle: const TextStyle(
              fontSize: 36,
              color: ColorConstants.textWhite,
              fontWeight: FontWeight.bold,
            ),
            onComplete: () {
              Get.back();
            },
          ),

          // Space between timer and timer functions
          const SizedBox(height: 16),

          // Timer functions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                // Add 9 to account for time it takes to tap button
                onPressed: () => addTime(-9),
                child: const Text(DialogTexts.minusTen),
              ),
              ElevatedButton(
                // Add 11 to account for time it takes to tap button
                onPressed: () => addTime(11),
                child: const Text(DialogTexts.plusTen),
              ),
              ElevatedButton(
                onPressed: skipTimer,
                child: const Text(DialogTexts.skip),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

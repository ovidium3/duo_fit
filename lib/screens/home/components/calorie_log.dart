import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/data/general_data.dart';
import '/constants/text/app_texts.dart';
import '/controllers/calorie_log_controller.dart';

import 'food_tab_bar.dart';

// Contains circular calorie display, custom foods list, and foods eaten list
class CalorieLog extends StatelessWidget {
  CalorieLog({super.key});

  // Dependency injection
  final CalorieLogController calorieLogController =
      Get.put(CalorieLogController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Calorie circle wrapped in observable widget
        Obx(() => buildCalorieCircle(context)),

        // Space between calorie circle and foods tab bar
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Foods tab bar
            SizedBox(
              height: 40,
              child: TabBar(
                labelColor: ColorConstants.tabBar,
                isScrollable: true,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                controller: calorieLogController.foodsTabController,
                tabs: DataConstants.foodTabs,
              ),
            ),

            // Edit foods button
            TextButton(
              onPressed: () {
                calorieLogController.editFoods();
              },
              child: const Text(
                TextConstants.editFoods,
                style: TextStyle(
                  color: ColorConstants.primaryColor,
                ),
              ),
            ),
          ],
        ),

        // Space between food tab bar and food lists
        const SizedBox(height: 10),

        // Food lists
        LimitedBox(
          maxHeight: 300,
          child: TabBarView(
            controller: calorieLogController.foodsTabController,
            children: [
              // Your foods tab
              Center(
                child: Obx(
                  () => FoodTabBar(
                    title: TextConstants.yourFoods,
                    foodList: calorieLogController.foods.toList(),
                    foodFunction: calorieLogController.addFoodToEaten,
                  ),
                ),
              ),

              // Foods eaten tab
              Center(
                child: Obx(
                  () => FoodTabBar(
                    title: TextConstants.foodsEaten,
                    foodList: calorieLogController.foodsEaten.toList(),
                    foodFunction: calorieLogController.removeFoodFromEaten,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Calorie circle display build method
  Widget buildCalorieCircle(BuildContext context) {
    // Calorie circle values extracted from calorie log controller
    int caloriesRemaining = calorieLogController.caloriesRemaining.value;
    int caloriesGoal = calorieLogController.caloriesGoal.value;

    double progress = (caloriesRemaining / caloriesGoal) * 100;
    Color progressColor = ColorConstants.primaryColor;
    Color? backgroundColor = ColorConstants.textGrey;

    // Circle color display depending on calories remaining
    if (caloriesRemaining < 0) {
      if (caloriesRemaining <= -500) {
        progressColor = ColorConstants.wayWayOverCount;
      } else if (caloriesRemaining <= -250) {
        progressColor = ColorConstants.wayOverCount;
      } else {
        progressColor = ColorConstants.overCount;
      }
    }

    // Widget build method
    return LayoutBuilder(
      builder: (context, constraints) {
        double size = constraints.maxWidth < constraints.maxHeight
            ? constraints.maxWidth
            : constraints.maxHeight;

        return SizedBox(
          // Aligns to center
          width: size,
          height: size * 0.6,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Calorie circle
              SizedBox(
                width: size * 0.6,
                height: size * 0.6,
                child: CircularProgressIndicator(
                  value: progress / 100,
                  valueColor: AlwaysStoppedAnimation<Color?>(backgroundColor),
                  backgroundColor: progressColor,
                  strokeWidth: size * 0.03,
                ),
              ),

              // Text inside calorie circle
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Calories remaining text
                  Text(
                    TextConstants.caloriesRemaining,
                    style: TextStyle(
                      fontSize: size * 0.05,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.textWhite.withOpacity(0.75),
                    ),
                  ),

                  // Number of calories remaining
                  Text(
                    '$caloriesRemaining',
                    style: TextStyle(
                      fontSize: size * 0.12,
                      fontWeight: FontWeight.bold,
                      color: progressColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

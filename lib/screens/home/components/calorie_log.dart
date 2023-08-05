import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/text/general_texts.dart';
import '/controllers/calorie_log_controller.dart';

class CalorieLog extends StatelessWidget {
  CalorieLog({super.key});

  // Dependency injection
  final CalorieLogController calorieLogController =
      Get.put(CalorieLogController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Calorie circle wrapped in observable widget
          Obx(
            () => buildCalorieCircle(context),
          ),

          // Your foods text / edit foods button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Your foods text
              Text(
                'Your Foods:',
                style: TextStyle(
                  color: ColorConstants.textWhite.withOpacity(0.75),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  calorieLogController.editFoods();
                },
                child: Text(
                  'Edit Foods',
                  style: TextStyle(
                    color: ColorConstants.textWhite.withOpacity(0.75),
                  ),
                ),
              ),
            ],
          ),

          // Space between your foods / edit foods and custom foods list
          const SizedBox(height: 10),

          // Custom foods list wrapped in observable widget
          Obx(
            () => LimitedBox(
              maxHeight: 300,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstants.backgroundColor,
                ),
                child: calorieLogController.foods.toList().isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: calorieLogController.foods.toList().length,
                        itemBuilder: (context, index) {
                          final food =
                              calorieLogController.foods.toList()[index];
                          return ListTile(
                            trailing: GestureDetector(
                              onTap: () {
                                calorieLogController.addFoodToEaten(food);
                              },
                              child: const Icon(
                                Icons.add,
                                color: ColorConstants.iconGreen,
                              ),
                            ),
                            title: Text(
                              '${food.name} (${food.calories} calories)',
                              style: const TextStyle(
                                color: ColorConstants.textGrey,
                                fontSize: 14,
                              ),
                            ),
                          );
                        },
                      )
                    : const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            TextConstants.addFoodPlaceholder,
                            style: TextStyle(
                              color: ColorConstants.textGrey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ),

          // Space between custom foods list and foods eaten text
          const SizedBox(height: 20),

          // Foods eaten text
          Text(
            'Foods Eaten:',
            style: TextStyle(
              color: ColorConstants.textWhite.withOpacity(0.75),
            ),
          ),

          // Space between foods eaten text and foods eaten list
          const SizedBox(height: 10),

          // Foods eaten list
          Obx(
            () => LimitedBox(
              maxHeight: 300,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstants.backgroundColor,
                ),
                child: calorieLogController.foodsEaten.toList().isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount:
                            calorieLogController.foodsEaten.toList().length,
                        itemBuilder: (context, index) {
                          final food =
                              calorieLogController.foodsEaten.toList()[index];

                          return ListTile(
                            trailing: GestureDetector(
                              onTap: () {
                                calorieLogController.removeFoodFromEaten(food);
                              },
                              child: const Icon(
                                Icons.remove,
                                color: ColorConstants.iconRed,
                              ),
                            ),
                            title: Text(
                              '${food.name} (${food.calories} calories) x ${food.quantity}',
                              style: const TextStyle(
                                color: ColorConstants.textGrey,
                                fontSize: 14,
                              ),
                            ),
                          );
                        },
                      )
                    : const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            TextConstants.addFoodPlaceholder,
                            style: TextStyle(
                              color: ColorConstants.textGrey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCalorieCircle(BuildContext context) {
    int caloriesRemaining = calorieLogController.caloriesRemaining.value;
    int caloriesGoal = calorieLogController.caloriesGoal.value;

    double progress = (caloriesRemaining / caloriesGoal) * 100;
    Color progressColor = ColorConstants.primaryColor;
    Color? backgroundColor = ColorConstants.textGrey;

    if (caloriesRemaining < 0) {
      if (caloriesRemaining <= -500) {
        progressColor = ColorConstants.wayWayOverCount;
      } else if (caloriesRemaining <= -250) {
        progressColor = ColorConstants.wayOverCount;
      } else {
        progressColor = ColorConstants.overCount;
      }
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        double size = constraints.maxWidth < constraints.maxHeight
            ? constraints.maxWidth
            : constraints.maxHeight;

        return SizedBox(
          width: size,
          height: size * 0.5,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: size * 0.5,
                height: size * 0.5,
                child: CircularProgressIndicator(
                  value: progress / 100,
                  valueColor: AlwaysStoppedAnimation<Color?>(backgroundColor),
                  backgroundColor: progressColor,
                  strokeWidth: size * 0.03,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TextConstants.caloriesRemaining,
                    style: TextStyle(
                      fontSize: size * 0.04,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.textWhite.withOpacity(0.75),
                    ),
                  ),
                  Text(
                    '$caloriesRemaining',
                    style: TextStyle(
                      fontSize: size * 0.1,
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

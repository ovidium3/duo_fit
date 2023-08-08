import 'package:flutter/material.dart';

import '/constants/color_constants.dart';
import '/constants/text/app_texts.dart';
import '/models/food_model.dart';

// Food tab bar display under calorie log
class FoodTabBar extends StatelessWidget {
  final String title;
  final List<FoodModel> foodList;
  final Function foodFunction;

  const FoodTabBar({
    required this.title,
    required this.foodList,
    required this.foodFunction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 300,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.backgroundColor,
        ),
        child: foodList.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: foodList.length,
                itemBuilder: (context, index) {
                  final food = foodList[index];
                  return ListTile(
                    trailing: GestureDetector(
                      onTap: () {
                        foodFunction(food);
                      },
                      child: (title == TextConstants.yourFoods)
                          ? const Icon(
                              Icons.add,
                              color: ColorConstants.iconGreen,
                            )
                          : const Icon(
                              Icons.remove,
                              color: ColorConstants.iconRed,
                            ),
                    ),
                    title: (title == TextConstants.yourFoods)
                        ? Text(
                            '${food.name} (${food.calories} calories)',
                            style: const TextStyle(
                              color: ColorConstants.textGrey,
                              fontSize: 14,
                            ),
                          )
                        : Text(
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
    );
  }
}

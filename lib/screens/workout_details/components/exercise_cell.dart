import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/models/exercise_model.dart';
import '/screens/workout_details/exercise_details_page.dart';

// Creates a display consisting of an image, title, and set count of an exercise
class ExerciseCell extends StatelessWidget {
  final ExerciseModel currentExercise;

  const ExerciseCell({required this.currentExercise, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: () {
        Get.to(ExerciseDetailsPage(exercise: currentExercise));
      },
      child: Container(
        width: double.infinity,
        padding:
            const EdgeInsets.only(left: 10, right: 25, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: ColorConstants.backgroundOverlay,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // Exercise image
            Container(
              width: 75,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage(currentExercise.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Space between exercise image and exercise text
            const SizedBox(width: 10),

            // Exercise text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Exercise title
                  Text(
                    currentExercise.title,
                    style: const TextStyle(
                      color: ColorConstants.textWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  // Exercise sets
                  Text(
                    '${currentExercise.sets} sets',
                    style: const TextStyle(
                      color: ColorConstants.textWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            // Space between exercise text and right arrow
            const SizedBox(width: 10),

            // Right arrow
            const Icon(Icons.arrow_forward_ios,
                color: ColorConstants.primaryColor),
          ],
        ),
      ),
    );
  }
}

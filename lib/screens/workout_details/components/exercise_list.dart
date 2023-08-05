import 'package:get/get.dart';

import '/models/exercise_model.dart';
import '/models/workout_model.dart';
import 'package:flutter/material.dart';
import '/constants/color_constants.dart';

import '/screens/workout_details/exercise_details_page.dart';

class ExerciseList extends StatelessWidget {
  final WorkoutModel workout;

  const ExerciseList({required this.workout, super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollbarTheme(
      data: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(ColorConstants.primaryColor),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.all(5),
        itemCount: workout.exerciseDataList.length,
        itemBuilder: (context, index) {
          return ExerciseCell(
            currentExercise: workout.exerciseDataList[index],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 15);
        },
      ),
    );
  }
}

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
                  Text(
                    currentExercise.title,
                    style: const TextStyle(
                      color: ColorConstants.textWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "${currentExercise.sets} sets",
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

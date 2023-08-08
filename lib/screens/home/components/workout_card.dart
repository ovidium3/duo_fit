import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/models/workout_model.dart';
import '/screens/workout_details/workout_details_page.dart';

// Workout card in workout tab
class WorkoutCard extends StatelessWidget {
  final WorkoutModel workout;

  const WorkoutCard({
    required this.workout,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(WorkoutDetailsPage(
          workout: workout,
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Fitted workout image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: ColorConstants.backgroundColor,
                width: 130,
                height: 130,
                child: Image.asset(
                  workout.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Space between workout image and workout title
            const SizedBox(height: 10),

            // Workout title
            Text(
              workout.title,
              style: TextStyle(
                color: ColorConstants.textWhite.withOpacity(0.75),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

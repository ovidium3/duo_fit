import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/models/workout_model.dart';
import '/screens/workout_details/workout_details_page.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    required this.workout,
    super.key,
  });

  final WorkoutModel workout;

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
            const SizedBox(height: 10),
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

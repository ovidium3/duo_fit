import 'package:flutter/material.dart';

import '/constants/color_constants.dart';
import '/models/workout_model.dart';

import 'workout_card.dart';

// Workout tab bar display at bottom of page
class WorkoutTabBar extends StatelessWidget {
  final String title;
  final List<WorkoutModel> workoutList;

  const WorkoutTabBar({
    required this.title,
    required this.workoutList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Space between tab bar and workout title
        const SizedBox(height: 10),

        // Workout title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
                color: ColorConstants.textWhite,
              ),
            ),
          ],
        ),

        // Space between workout title and workouts
        const SizedBox(height: 20),

        // Horizontal workout scroll view
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Wrap(
            children: [
              ...List.generate(
                workoutList.length,
                (index) => WorkoutCard(
                  workout: workoutList[index],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

import 'package:duo_fit/constants/color_constants.dart';
import 'package:flutter/material.dart';

import 'workout_card.dart';
import '/models/workout_model.dart';

class WorkoutTabBar extends StatelessWidget {
  const WorkoutTabBar({
    required this.title,
    required this.workoutList,
    this.itemsToShow = 3,
    super.key,
  });

  final String title;
  final List<WorkoutModel> workoutList;
  final int itemsToShow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
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
        const SizedBox(height: 20),
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

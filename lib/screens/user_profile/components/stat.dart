import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

// Class that displays custom user stats such as lbs lost and workouts completed
class UserStatistic extends StatelessWidget {
  final String statTitle, statValue;

  const UserStatistic({
    required this.statTitle,
    required this.statValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Statistic value text
        Text(
          statValue,
          style: const TextStyle(
            fontSize: 23,
            color: ColorConstants.textWhite,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Space between statistic value text and statistic title
        const SizedBox(height: 10),

        // Statistic title
        Text(
          statTitle,
          style: const TextStyle(
            fontSize: 14,
            color: ColorConstants.textWhite,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

// Class that displays custom user stats such as lbs lost and workouts completed
class UserStatistic extends StatelessWidget {
  const UserStatistic({
    required this.statTitle,
    required this.statValue,
    super.key,
  });

  final String statTitle, statValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          statValue,
          style: const TextStyle(
            fontSize: 23,
            color: ColorConstants.textWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
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

import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

// Represents a step of a given exercise
class ExerciseStep extends StatelessWidget {
  final String number;
  final String description;

  const ExerciseStep({
    required this.number,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Step number
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorConstants.primaryColor.withOpacity(0.12),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: ColorConstants.primaryColor,
              ),
            ),
          ),
        ),

        // Space between step number and step description
        const SizedBox(width: 10),

        // Step description
        Expanded(
            child: Text(
          description,
          style: const TextStyle(
            color: ColorConstants.textWhite,
          ),
        )),
      ],
    );
  }
}

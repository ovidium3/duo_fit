import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

class ExerciseStep extends StatelessWidget {
  final String number;
  final String description;

  const ExerciseStep(
      {required this.number, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorConstants.green.withOpacity(0.12),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: ColorConstants.green,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
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

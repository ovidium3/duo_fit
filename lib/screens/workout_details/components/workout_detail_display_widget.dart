import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

// Creates either workout time widget or exercise count widget in top left
class WorkoutDetailDisplay extends StatelessWidget {
  final String text;
  final bool isTime;

  const WorkoutDetailDisplay({
    required this.text,
    this.isTime = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(40),
      ),
      width: isTime == true ? 80 : 110,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          // Time icon or person icon
          Icon(
            isTime == true ? Icons.schedule : Icons.accessibility,
            color: ColorConstants.iconWhite,
            size: 16,
          ),

          // Workout duration or exercise count
          Text(
            text,
            style: const TextStyle(
              color: ColorConstants.textWhite,
            ),
          ),
        ],
      ),
    );
  }
}

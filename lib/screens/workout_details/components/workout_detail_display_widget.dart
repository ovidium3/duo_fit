import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

class WorkoutDetailDisplay extends StatelessWidget {
  const WorkoutDetailDisplay({
    required this.text,
    this.isTime = true,
    super.key,
  });

  final String text;
  final bool isTime;

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
          Icon(
            isTime == true ? Icons.schedule : Icons.accessibility,
            color: ColorConstants.iconWhite,
            size: 16,
          ),
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

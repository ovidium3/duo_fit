import 'package:flutter/material.dart';

import '/constants/text/app_texts.dart';
import '/constants/color_constants.dart';

// Find your workout text display above workout tab bar
class FindYourWorkout extends StatelessWidget {
  const FindYourWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      // Find text (in primary color)
      text: TextSpan(
        text: TextConstants.find,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
          fontSize: 25,
        ),

        // Remainder of text
        children: const [
          // Space between find and your workout
          TextSpan(text: ' '),

          // Your workout text (in white)
          TextSpan(
            text: (TextConstants.yourWorkout),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorConstants.textWhite,
            ),
          ),
        ],
      ),
    );
  }
}

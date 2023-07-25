import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/text_constants/general_text_constants.dart';
import '../../../helpers/string_methods.dart';

class FindYourWorkout extends StatelessWidget {
  const FindYourWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: capitalize(TextConstants.find),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
          fontSize: 25,
        ),
        children: [
          const TextSpan(text: " "),
          TextSpan(
            text: capitalize(TextConstants.yourWorkout),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/text/general_texts.dart';
import '../../../helpers/string_methods.dart';

class FindYourWorkout extends StatelessWidget {
  const FindYourWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: (TextConstants.find),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
          fontSize: 25,
        ),
        children: [
          const TextSpan(text: " "),
          TextSpan(
            text: (TextConstants.yourWorkout),
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

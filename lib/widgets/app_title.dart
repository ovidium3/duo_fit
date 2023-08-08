import 'package:flutter/material.dart';

import '/constants/color_constants.dart';
import '/constants/text/app_texts.dart';

// Text display widget for a dual color app title
class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        // First word in primary color
        text: TextSpan(
          text: TextConstants.duo.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 30,
            letterSpacing: 3,
          ),
          children: [
            // Gap between words
            const TextSpan(text: ' '),
            // Second word in white
            TextSpan(
              text: TextConstants.fit.toUpperCase(),
              style: const TextStyle(
                color: ColorConstants.textWhite,
                fontSize: 30,
                letterSpacing: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

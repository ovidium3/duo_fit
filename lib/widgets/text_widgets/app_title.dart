import 'package:flutter/material.dart';

import '/constants/color_constants.dart';
import '/constants/text/general_texts.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: TextConstants.duo.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 30,
            letterSpacing: 3,
          ),
          children: [
            const TextSpan(text: ' '),
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

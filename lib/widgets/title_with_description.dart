import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

// Text display widget for a monochromatic title and description
class TitleWithDescription extends StatelessWidget {
  final String title;
  final String description;

  const TitleWithDescription({
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 250,
        child: RichText(
          // Title display
          text: TextSpan(
            text: '$title\n',
            style: const TextStyle(
              height: 1.4,
              letterSpacing: 1,
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: ColorConstants.textWhite,
            ),
            children: [
              // Description display below title
              TextSpan(
                text: description,
                style: const TextStyle(
                  letterSpacing: 0,
                  fontSize: 14,
                  color: ColorConstants.textWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

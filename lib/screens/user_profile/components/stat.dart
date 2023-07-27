import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';

class Stat extends StatelessWidget {
  Stat({
    required this.statTitle,
    required this.statValue,
    super.key,
  });

  String statTitle, statValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          statValue,
          style: const TextStyle(
            fontSize: 23,
            color: ColorConstants.textWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          statTitle,
          style: const TextStyle(
            fontSize: 14,
            color: ColorConstants.textWhite,
          ),
        ),
      ],
    );
  }
}

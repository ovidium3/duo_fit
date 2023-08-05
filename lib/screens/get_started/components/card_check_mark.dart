import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

// Checkmark symbol widget that appears on a ChoiceCard when tapped
class CheckMark extends StatelessWidget {
  final bool isChecked, isTappedDown;
  final double opacity;

  const CheckMark({
    required this.isChecked,
    required this.opacity,
    required this.isTappedDown,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isTappedDown ? 0.5 : 1,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 100),
        scale: isChecked || isTappedDown ? 1 : 0,
        child: Container(
          decoration: BoxDecoration(
            color: ColorConstants.cardChecked,
            borderRadius: BorderRadius.circular(50),
          ),
          width: 35,
          height: 35,
          child: Icon(
            Icons.check,
            color: Theme.of(context).primaryColor,
            size: 17,
          ),
        ),
      ),
    );
  }
}

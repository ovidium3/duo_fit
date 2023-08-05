import 'package:flutter/material.dart';
import '/constants/color_constants.dart';
import '/constants/text/general_texts.dart';

class FinishButton extends StatelessWidget {
  final String title;
  final Function() onFinish;

  const FinishButton({
    this.title = TextConstants.finish,
    required this.onFinish,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      decoration: BoxDecoration(
        color: ColorConstants.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: ColorConstants.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onFinish,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: ColorConstants.textWhite,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

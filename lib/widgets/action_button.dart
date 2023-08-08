import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

// Dual style button used for actions like sign up, login, and edit profile
class ActionButton extends StatelessWidget {
  final String text;
  final bool isOutlined;
  final void Function()? onPressed;
  final bool isRounded;

  const ActionButton({
    required this.text,
    required this.isOutlined,
    required this.onPressed,
    this.isRounded = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            side: BorderSide(
              color: isOutlined
                  ? ColorConstants.textWhite
                  : Theme.of(context).primaryColor,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(isRounded ? 30 : 10),
            ),
            backgroundColor: isOutlined
                ? ColorConstants.transparent
                : Theme.of(context).primaryColor,
            foregroundColor: Theme.of(context).primaryColor),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: ColorConstants.textWhite,
          ),
        ),
      ),
    );
  }
}

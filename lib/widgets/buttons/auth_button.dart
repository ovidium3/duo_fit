import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

// Button used for auth functions like sign up and login
class AuthButton extends StatelessWidget {
  const AuthButton({
    required this.text,
    required this.isOutlined,
    required this.onPressed,
    this.isRounded = true,
    super.key,
  });

  final void Function()? onPressed;
  final String text;
  final bool isOutlined;
  final bool isRounded;

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

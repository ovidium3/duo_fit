import 'package:flutter/material.dart';

import '../../../helpers/string_methods.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.text,
    required this.isOutlined,
    this.isRounded = true,
    required this.onPressed,
    super.key,
  });
  final void Function()? onPressed;
  final String text;
  bool isOutlined = false;
  bool isRounded = true;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1 * btnScaleValue,
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              side: BorderSide(
                color:
                    isOutlined ? Colors.white : Theme.of(context).primaryColor,
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(isRounded ? 30 : 10),
              ),
              backgroundColor: isOutlined
                  ? Colors.transparent
                  : Theme.of(context).primaryColor,
              foregroundColor: Theme.of(context).primaryColor),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

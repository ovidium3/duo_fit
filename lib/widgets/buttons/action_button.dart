import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

// Confirmation button used by dialogs asking for confirmation
class ActionButton extends StatelessWidget {
  const ActionButton({
    this.icon = const Icon(Icons.close, color: ColorConstants.iconBlack),
    required this.onTap,
    super.key,
  });

  final Icon? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: ColorConstants.textWhite,
          borderRadius: BorderRadius.circular(40),
        ),
        child: icon,
      ),
    );
  }
}

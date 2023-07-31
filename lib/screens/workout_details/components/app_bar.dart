import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text,
        style: const TextStyle(
          color: ColorConstants.textWhite,
          fontSize: 25,
        ),
      ),
      toolbarHeight: 80,
      iconTheme: const IconThemeData(color: ColorConstants.iconWhite),
      backgroundColor: ColorConstants.transparent,
      elevation: 0,
    );
  }
}

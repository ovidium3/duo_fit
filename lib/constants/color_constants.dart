import 'package:flutter/material.dart';

class ColorConstants {
  // Main color scheme
  static const Color darkBlue = Color(0xff131429);
  static const Color overlayBlue = Color.fromARGB(255, 32, 34, 69);
  static const Color green = Color(0xff40D876);
  static const Color inputDecor = Colors.white;
  static const Color tabBar = Colors.white;

  // Text colors
  static const Color textWhite = Colors.white;

  // Icon colors
  static const Color iconWhite = Colors.white;
  static const Color iconBlack = Colors.black;

  // Calorie circle colors
  static const overCount = Colors.yellow;
  static const wayOverCount = Colors.orange;
  static const wayWayOverCount = Colors.red;

  static final closeFood = Colors.grey[300];
  static const confirmRemoveFood = Colors.red;

  // Workout colors
  static const warmUpSet = Colors.yellow;
  static const workingSet = ColorConstants.green;
  static const failureSet = Colors.red;

  // Other colors
  static const Color starFilled = Colors.yellow;
  static const Color starEmpty = Colors.white;
  static const Color error = Colors.red;
  static const Color transparent = Colors.transparent;
  static const Color disabled = Color(0xFFE1E1E5);
}

// fitness app colors
class OldColorConstants {
  // Main color scheme
  static const primaryColor = Colors.blue;
  static const backgroundColor = Colors.white;

  // Text colors
  static const textBlack = Colors.black;
  static const textGrey = Color(0xFF8F98A3);
  static const textWhite = Colors.white;

  // Calorie circle colors
  static const overCount = Colors.yellow;
  static const wayOverCount = Colors.orange;
  static const wayWayOverCount = Colors.red;

  static final closeFood = Colors.grey[300];
  static const confirmRemoveFood = Colors.red;

  // Workout colors
  static const warmUpSet = Colors.yellow;
  static const regularSet = OldColorConstants.primaryColor;
  static const failureSet = Colors.red;

  static const finish = Color.fromARGB(255, 52, 208, 65);
  static const cancelWorkout = Colors.red;

  // Account info colors
  static const disabledColor = Color(0xFFE1E1E5);
  static const errorColor = Colors.red;
  static const loadingBlack = Color(0x80000000);

  static const showEyeGrey = textGrey;
  static const showEyePrimary = primaryColor;

  // Other colors
  static const transparent = Colors.transparent;
  static final borderShadow = Colors.black.withOpacity(0.12);
  static final reminderNotSelected = Colors.grey.withOpacity(0.25);
}

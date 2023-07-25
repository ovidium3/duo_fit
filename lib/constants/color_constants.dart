import 'package:flutter/material.dart';

class ColorConstants {
  // Main color scheme
  static const Color darkBlue = Color(0xff131429);
  static const Color green = Color(0xff40D876);
  static const Color textWhite = Colors.white;

  // Text colors
  static const Color textBlack = Colors.black;

  // Other colors
  static const Color error = Colors.red;
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

import 'package:flutter/material.dart';

// Contains all of the colors used throughout the app
class ColorConstants {
  // Main color scheme
  static const Color backgroundColor = Color(0xff131429);
  static const Color backgroundOverlay = Color.fromARGB(255, 32, 34, 69);
  static const Color primaryColor = Color(0xff40D876);
  static const Color inputDecor = Colors.white;
  static const Color tabBar = Colors.white;

  // Text colors
  static const Color textWhite = Colors.white;
  static const Color textGrey = Color.fromARGB(255, 224, 224, 224);

  // Icon colors
  static const Color iconWhite = Colors.white;
  static const Color iconBlack = Colors.black;
  static const Color iconGreen = ColorConstants.primaryColor;
  static const Color iconRed = ColorConstants.error;

  // Calorie log colors
  static const Color overCount = Colors.yellow;
  static const Color wayOverCount = Colors.orange;
  static const Color wayWayOverCount = Colors.red;

  // Set type colors
  static const warmUpSet = Colors.yellow;
  static const workingSet = ColorConstants.primaryColor;

  // Other colors
  static const Color error = Colors.red;
  static const Color transparent = Colors.transparent;
  static const Color disabled = Color(0xFFE1E1E5);
  static const Color cardChecked = Color(0xff373850);
}

import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

// Main theme colorations and input decoration
class MainTheme {
  late BuildContext context;

  MainTheme(this.context);

  static final inputDecoration = InputDecorationTheme(
    filled: true,
    labelStyle: TextStyle(color: ColorConstants.inputDecor.withOpacity(0.7)),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: ColorConstants.inputDecor),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: ColorConstants.inputDecor),
    ),
  );

  late ThemeData themeData = ThemeData(
    textTheme: Theme.of(context).textTheme,
    fontFamily: 'NotoSansKR',
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: colorCustom,
    ),
    inputDecorationTheme: MainTheme.inputDecoration,
    primaryColor: ColorConstants.primaryColor,
  );
}

Map<int, Color> color = {
  50: const Color.fromRGBO(136, 14, 79, .1),
  100: const Color.fromRGBO(136, 14, 79, .2),
  200: const Color.fromRGBO(136, 14, 79, .3),
  300: const Color.fromRGBO(136, 14, 79, .4),
  400: const Color.fromRGBO(136, 14, 79, .5),
  500: const Color.fromRGBO(136, 14, 79, .6),
  600: const Color.fromRGBO(136, 14, 79, .7),
  700: const Color.fromRGBO(136, 14, 79, .8),
  800: const Color.fromRGBO(136, 14, 79, .9),
  900: const Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor colorCustom = MaterialColor(0xff40D876, color);

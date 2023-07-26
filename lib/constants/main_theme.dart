import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

class MainTheme {
  MainTheme(this.context);

  static final inputDecoration = inputDecorationTheme;
  late BuildContext context;

  late ThemeData themeData = ThemeData(
    textTheme: Theme.of(context).textTheme,
    fontFamily: 'NotoSansKR',
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: colorCustom,
    ),
    inputDecorationTheme: MainTheme.inputDecoration,
    primaryColor: ColorConstants.green,
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

InputDecorationTheme? inputDecorationTheme = InputDecorationTheme(
  filled: true,
  labelStyle: TextStyle(color: ColorConstants.inputDecor.withOpacity(.7)),
  enabledBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: ColorConstants.inputDecor),
  ),
  focusedBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: ColorConstants.inputDecor),
  ),
);

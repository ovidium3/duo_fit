import 'package:flutter/material.dart';

import '../../view/widgets/map_of_colors.dart';
import '../color_constants.dart';
import '../themes/input_decoration.dart';

class MainTheme {
  static final inputDecoration = inputDecorationTheme;

  MainTheme(this.context);

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

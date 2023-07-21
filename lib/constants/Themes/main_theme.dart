import 'package:flutter/material.dart';

import '../../view/widgets/general_widgets/customMaterialColor.dart';
import '../color_constants.dart';
import 'inputDecoration.dart';

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
    primaryColor: AppColors.green,
  );
}

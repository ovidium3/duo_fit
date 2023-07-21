import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:duo_fit/bindings/initial_binding.dart';
import 'package:duo_fit/config/Themes/mainThemeFile.dart';
import 'package:duo_fit/config/initial_main_methods/initial_main_methods.dart';
import 'config/routes.dart';

void main() async {
  await MainMethods.init();
  runApp(
    const FitnessApp(),
  );
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      defaultTransition: Transition.fade,
      theme: MainTheme(context).themeData,
      debugShowCheckedModeBanner: false,
      getPages: Routes.pages,
      initialRoute: "/",
    );
  }
}

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:duo_fit/bindings/initial_binding.dart';
import 'package:duo_fit/constants/themes/main_theme.dart';
import 'package:duo_fit/main_configurations/app_configurations.dart';
import 'package:duo_fit/main_configurations/firebase_configurations.dart';
import 'package:duo_fit/main_configurations/openfoodfacts_configurations.dart';
import 'constants/routes.dart';

void main() async {
  await AppConfigurations.init();
  await FirebaseConfigurations.init();
  OpenfoodfactsConfigurations.init();
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

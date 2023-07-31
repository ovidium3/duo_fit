import "package:flutter/material.dart";
import 'package:get/get.dart';

import '/configurations/bindings/initial_bindings.dart';
import 'configurations/app_configurations.dart';
import 'configurations/firebase_configurations.dart';
import 'configurations/openfoodfacts_configurations.dart';
import 'constants/main_theme.dart';
import 'constants/routes.dart';

void main() async {
  // Call initialization methods for each service
  AppConfigurations.init();
  await FirebaseConfigurations.init();
  OpenfoodfactsConfigurations.init();
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      defaultTransition: Transition.fade,
      theme: MainTheme(context).themeData,
      debugShowCheckedModeBanner: false,
      getPages: Routes.pages,
      initialRoute: "/",
    );
  }
}

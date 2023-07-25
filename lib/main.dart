import "package:flutter/material.dart";
import 'package:get/get.dart';

import '/bindings/initial_bindings.dart';
import 'constants/main_theme.dart';
import '/configurations/app_configurations.dart';
import '/configurations/firebase_configurations.dart';
import '/configurations/openfoodfacts_configurations.dart';
import '/constants/routes.dart';

void main() async {
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
      initialBinding: InitialBinding(),
      defaultTransition: Transition.fade,
      theme: MainTheme(context).themeData,
      debugShowCheckedModeBanner: false,
      getPages: Routes.pages,
      initialRoute: "/",
    );
  }
}

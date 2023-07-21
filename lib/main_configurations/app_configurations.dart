import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppConfigurations {
  static Future<void> init() async {
    // init binding
    WidgetsFlutterBinding.ensureInitialized();

    // set device orientation to portrait only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

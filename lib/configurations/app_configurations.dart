import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppConfigurations {
  // Initialize widgets & lock orientation to portrait mode
  static void init() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

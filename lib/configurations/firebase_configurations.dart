import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

class FirebaseConfigurations {
  static Future<void> init() async {
    // init firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}

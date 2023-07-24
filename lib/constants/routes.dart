import 'package:get/get.dart';
import 'package:duo_fit/screens/auth/sign_up_page.dart';
import 'package:duo_fit/screens/welcome/welcome_page.dart';

import '../bindings/forgot_password_binding.dart';
import '../bindings/get_started_binding.dart';
import '../bindings/auth_bindings.dart';
import '../bindings/welcome_binding.dart';
import '../screens/get_started/get_started_page.dart';
import '../screens/auth/forgot_password_page.dart';
import '../screens/auth/login_page.dart';

class Routes {
  static final List<GetPage> pages = [
    GetPage(
      name: "/",
      page: () => WelcomePage(),
      binding: WelcomePageBinding(),
    ),
    GetPage(
      name: "/getStarted",
      page: () => GetStartedPage(),
      binding: GetStartedBinding(),
    ),
    GetPage(
      name: "/signUp",
      page: () => SignUpPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: "/login",
      page: () => LoginPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: "/forgotPassword",
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}

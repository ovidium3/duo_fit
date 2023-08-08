import 'package:get/get.dart';

import '/configurations/bindings/auth_bindings.dart';
import '/screens/auth/email_verification_page.dart';
import '/screens/auth/forgot_password_page.dart';
import '/screens/auth/login_page.dart';
import '/screens/auth/sign_up_page.dart';
import '/screens/get_started/get_started_page.dart';
import '/screens/get_started/welcome_page.dart';

// Contains all routes and bindings for auth pages
class AuthRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => WelcomePage(),
      // No binding required
    ),
    GetPage(
      name: '/getStarted',
      page: () => GetStartedPage(),
      binding: GetStartedBinding(),
    ),
    GetPage(
      name: '/signUp',
      page: () => SignUpPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: '/forgotPassword',
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: '/emailVerification',
      page: () => EmailVerificationPage(),
      binding: EmailVerificationBinding(),
    ),
  ];
}

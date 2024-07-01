import 'package:get/get.dart';
import '../binding/splash_binding.dart';
import '../view/auth/login_screen.dart';
import '../view/auth/registration_screen.dart';
import '../view/auth/registration_next_screen.dart';
import '../view/befor_auth/splash_screen.dart';
import 'routes.dart';

class Pages{
  static var list = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.registrationScreen,
      page: () => RegistrationScreen(),
    ),
    GetPage(
      name: Routes.registrationNextScreen,
      page: () => RegistrationNextScreen(),
    ),
  ];
}

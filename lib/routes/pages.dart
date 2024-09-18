import 'package:get/get.dart';
import '../binding/dashboard_binding.dart';
import '../binding/splash_binding.dart';
import '../view/auth/login_screen.dart';
import '../view/auth/registration_screen.dart';
import '../view/auth/registration_next_screen.dart';
import '../view/auth/reset_password_screen.dart';
import '../view/befor_auth/splash_screen.dart';
import '../view/bottom_nav/bottom_nav_screen.dart';
import '../view/bottom_nav/properties/add_properties_screen/add_properties_screen.dart';
import '../view/bottom_nav/properties/edit_properties_screen/update_properties_screen.dart';
import '../view/bottom_nav/properties/properties_screen.dart';
import '../view/drawer_screens/change_password_screen.dart';
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

    GetPage(
      name: Routes.btmScreen,
      page: () => BottomNavScreen(),
      binding: DashboardBinding()
    ),
    GetPage(
      name: Routes.propertiesScreen,
      page: () => PropertiesScreen(),
    ),
    GetPage(
      name: Routes.addPropertiesScreen,
      page: () => AddPropertiesScreen(),
    ),
    GetPage(
      name: Routes.editPropertiesScreen,
      page: () => UpdatePropertiesScreen(),
    ),
    GetPage(
      name: Routes.changePasswordScreen,
      page: () => ChangePasswordScreen(),
    ),
    GetPage(
      name: Routes.resetPasswordScreen,
      page: () => ResetPasswordScreen(),
    ),
  ];
}

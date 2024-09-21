import 'package:bnb_clean/backend/extensions/custom_extensions.dart';

class ApiEndpoint {
  static String mainDomain = "https://api.mastersysobe.com";
  static String baseUrl = "$mainDomain/api";

  ///-> Auth
  static String loginURL = '/login'.addBaseURl();
  static String registerURL = '/register'.addBaseURl();

  ///-> Forget Password
  static String forgotPasswordURL = '/forgot-password'.addBaseURl();
  static String resetPasswordURL = '/reset-password'.addBaseURl();

  ///-> My-property
  static String myPropertyURL = '/my-property'.addBaseURl();
  static String myPropertySaveURL = '/my-property/save'.addBaseURl();
  static String shoppingCartURL = '/shopping-cart'.addBaseURl();

  ///-> Price-list
  static String priceListURL = '/price-list'.addBaseURl();

  ///-> Profile-Manage
  static String changePasswordURL = '/change-password'.addBaseURl();
  static String updateProfileURL = '/update-basic-info'.addBaseURl();
  static String profileURL = '/user-info'.addBaseURl();
}
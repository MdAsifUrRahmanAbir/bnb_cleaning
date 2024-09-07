import 'package:bnb_clean/backend/extensions/custom_extensions.dart';

class ApiEndpoint {
  static String mainDomain = "https://api.mastersysobe.com";
  static String baseUrl = "$mainDomain/api";

  ///-> Login
  static String loginURL = '/login'.addBaseURl();

  ///-> Register
  static String registerURL = '/register'.addBaseURl();

  ///-> My-property
  static String myPropertyURL = '/my-property'.addBaseURl();

  ///-> My-property-save
  static String myPropertySaveURL = '/my-property/save'.addBaseURl();

  ///-> Price-list
  static String priceListURL = '/price-list'.addBaseURl();

  ///-> Profile-Manage
  static String changePasswordURL = '/change-password'.addBaseURl();
  static String updateProfileURL = '/update-basic-info'.addBaseURl();
}
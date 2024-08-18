import 'package:bnb_clean/backend/extensions/custom_extensions.dart';

class ApiEndpoint {
  static String mainDomain = "https://fahim.appdevs.team/moneymate";
  static String baseUrl = "$mainDomain/api/v1";

  static String languagesURL = '/login'.addBaseURl();
  static String basicSettingsURL = '/settings/basic-settings'.addBaseURl();

  ///-> Login
  static String loginURL = '/login'.addBaseURl();

}
import 'package:bnb_clean/backend/extensions/custom_extensions.dart';

class ApiEndpoint {
  // static String mainDomain = "https://api.mastersysobe.com";
  // static String stripeUrl = "https://api.stripe.com/v1/payment_intents";
  // static String stripeSecretKey = "sk_test_51HTXM9LlJ7MCoKyltM3b5gAMjLVuZ77xzuQj6a29yTEGvfgBv92UQH6wYyjDTYPpIAloUN6TRET3c2Tk6MQsciec00HVhkR7wv";
  // static String stripePublishKey = "pk_test_51HTXM9LlJ7MCoKylcyIDBrswA5HHnaZe6MsYi82GIthVYKKK5pIc4ZVT9JOtvgwy5XVcJpdaq7BnYcl1LF9XqcS500kwqFD5tC";

  // static String mainDomain = "https://api.uniobe.com";
  // static String mainDomain = "https://mbl-apssszy.bnbcleaning.london";
  static String mainDomain = "https://pro.bnbcleaning.london";
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
  static String myPropertyDeleteURL = '/my-property/delete'.addBaseURl();
  static String myPropertyUpdateURL = '/properties'.addBaseURl();

  /// -> Cart
  static String shoppingCartURL = '/shopping-cart'.addBaseURl();   /// this url is using for 2 actions, get for index, post for store
  static String cartDeleteURL = '/cart-items'.addBaseURl();

  static String cartDateUpdateURL = '/cart'.addBaseURl();

  static String updateAirbnbServiceURL = '/airbnb-update'.addBaseURl();
  static String updateLineServiceURL = '/linen-update'.addBaseURl();
  static String updateMidStayServiceURL = '/mid-stay-update'.addBaseURl();
  static String updateProAndBundleServiceURL = '/pro-and-bundle-update'.addBaseURl();
  static String updateOtherServiceURL = '/optional-update'.addBaseURl();

  static String orderProcessURL = '/order-process'.addBaseURl();

  ///-> Price-list
  static String priceListURL = '/price-list'.addBaseURl();

  ///-> Profile-Manage
  static String changePasswordURL = '/change-password'.addBaseURl();
  static String updateProfileURL = '/update-basic-info'.addBaseURl();
  static String profileURL = '/user-info'.addBaseURl();


  ///-> My-Order
  static String todayOrderURL = '/orders/today'.addBaseURl();
  static String tomorrowOrderURL = '/orders/tomorrow'.addBaseURl();
  static String futureOrderURL = '/orders/future'.addBaseURl();
  static String pastOrderURL = '/orders/past'.addBaseURl();
}
import 'package:get/get.dart';

import '../controller/bottom_nav/bottom_nav_controller.dart';
import '../controller/bottom_nav/home_controller.dart';
import '../controller/bottom_nav/price_controller.dart';
import '../controller/bottom_nav/profile_controller.dart';
// import '../controller/bottom_nav/properties_controller.dart';
import '../controller/bottom_nav/shopping_cart_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(PriceController());
    Get.put(ProfileController());
    Get.put(BottomNavController());
    // Get.put(PropertiesController());
    Get.put(ShoppingCartController());
  }
}


import 'package:get/get.dart';

// import '../../view/bottom_nav/home/home_page.dart';
import '../../view/bottom_nav/home/home_page.dart';
import '../../view/bottom_nav/price/price_page.dart';
import '../../view/bottom_nav/profile/profile_page.dart';
import '../../view/bottom_nav/properties/properties_screen.dart';
import '../../view/bottom_nav/shopping_cart/shopping_cart_page.dart';

class BottomNavController extends GetxController{
  RxInt selectedIndex = 4.obs;
  RxBool isDark = false.obs;

  void onItemTapped(int index) {
      selectedIndex.value = index;
  }

  List body = [
    PropertiesScreen(),
    PricePage(),
    ShoppingCartPage(),
    ProfilePage(),
    HomePage(),
  ];

  List bodyTitle = [
    "Properties",
    "Prices",
    "Shopping Cart",
    "Profile",
    "How To Order",
  ];
}
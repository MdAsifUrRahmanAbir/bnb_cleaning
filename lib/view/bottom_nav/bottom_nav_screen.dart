import '../../controller/bottom_nav/bottom_nav_controller.dart';
import '../../routes/routes.dart';
import '../../utils/assets.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/appbar/dashboard_appbar.dart';
import '../../widgets/drawer/drawer_widget.dart';
import 'custom_bottom_nav_bar.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  final controller = Get.put(BottomNavController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: DashboardAppBar(
          onMenuTap: () {
            debugPrint("Clicked");
            _scaffoldKey.currentState!.openDrawer();
            debugPrint("Clicked");
          },
          title: Image.asset(Assets.appBasicLogo)),
      drawer: DrawerWidget(),
      body: _body(context),
      bottomNavigationBar: Obx(() => CustomBottomNavBar(
            selectedIndex: controller.selectedIndex.value,
            onItemTapped: controller.onItemTapped,
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.propertiesScreen);
        },
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.leaderboard_outlined,
          color: CustomColor.secondaryLightColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _body(BuildContext context) {
    return SafeArea(
        child: Obx(() => controller.body[controller.selectedIndex.value]));
  }
}

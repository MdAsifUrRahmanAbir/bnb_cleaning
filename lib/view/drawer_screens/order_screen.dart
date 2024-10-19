import '../../backend/utils/custom_loading_api.dart';
import '../../controller/bottom_nav/order_controller.dart';
import '../../controller/profile/change_password_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/strings.dart';
import '../../widgets/inputs/password_input_widget.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key, required this.appTitle});

  final String appTitle;

  final controller = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrimaryAppBar(
          title: appTitle
        ),
        body: SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeHorizontal,
                vertical: Dimensions.paddingSizeVertical,
              ),
              children: [

              ],
            )));
  }
}

import '../../../controller/bottom_nav/shopping_cart_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import 'shoping_cart_card_widget.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({super.key});
  final controller = Get.put(ShoppingCartController());

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.paddingSizeVertical * .5,
        horizontal: Dimensions.paddingSizeHorizontal * .5,
      ),
        itemBuilder: (context, index) {
          return Obx(() => ShoppingCardCardWidget(
            isExpansion: controller.selectedIndex.value == index,
            title: 'Duis velit voluptat',
            subTitle: 'Dolores similique im,Consectetur atque n ',
            price: '£0',
            date: 'Sunday 18 , August',
            onEdit: () {
              if (controller.selectedIndex.value != index) {
                controller.selectedIndex.value = index;
              } else {
                controller.selectedIndex.value = -1;
              }
            },
            onDelete: () {

            },
          ));
        },
        separatorBuilder: (_, i) => verticalSpace(5),
        itemCount: 5);
  }
}

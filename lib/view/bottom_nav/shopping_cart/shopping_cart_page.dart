import '../../../controller/bottom_nav/shopping_cart_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import 'cart_detail/cart_detail_screen.dart';
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
              contactDetails: 'Contact with admin. Email abc@email.abc',
              name: "Md Abir",
              phoneNumber: '+8801877348044',
              onNext: (DateTime date) {
                controller.selectedIndex.value = -1;

                Get.to(CartDetailScreen(
                  title: 'Duis velit voluptat',
                  subTitle: 'Dolores similique im,Consectetur atque n ',
                  price: '£0',
                  date: 'Sunday 18 , August',
                  initialDate: date,
                  contactDetails: 'Contact with admin. Email abc@email.abc',
                  name: "Md Abir",
                  phoneNumber: '+8801877348044',
                ));
              },
              onEdit: () {
                if (controller.selectedIndex.value != index) {
                  controller.selectedIndex.value = index;
                } else {
                  controller.selectedIndex.value = -1;
                }
              },
              onDelete: () {}));
        },
        separatorBuilder: (_, i) => verticalSpace(5),
        itemCount: 5);
  }
}

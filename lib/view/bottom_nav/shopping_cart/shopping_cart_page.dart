import '../../../controller/bottom_nav/shopping_cart_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import 'shoping_cart_card_widget.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({super.key});
  final controller = Get.put(ShoppingCartController());

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return ShoppingCardCardWidget(
            title: 'Duis velit voluptat',
            subTitle: 'Dolores similique im,Consectetur atque n ',
            price: '£0',
            date: 'Sunday 18 , August',
            onEdit: () {},
            onDelete: () {},
          );
        },
        separatorBuilder: (_, i) => verticalSpace(5),
        itemCount: 1);
  }
}

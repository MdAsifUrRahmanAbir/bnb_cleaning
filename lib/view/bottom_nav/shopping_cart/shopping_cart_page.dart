import 'package:bnb_clean/backend/utils/custom_loading_api.dart';
import 'package:bnb_clean/backend/utils/no_data_widget.dart';
import 'package:intl/intl.dart';
import 'package:php_serializer/php_serializer.dart';

import '../../../backend/model/my_property/cart_index_model.dart';
import '../../../controller/bottom_nav/shopping_cart_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import 'cart_detail/cart_detail_screen.dart';
import 'shoping_cart_card_widget.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({super.key});
  final controller = Get.put(ShoppingCartController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading
        ? const CustomLoadingAPI()
        : controller.cartIndexModel.cartItems.isEmpty
            ? const NoDataWidget()
            : _list());
  }

  _list() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.paddingSizeVertical * .5,
          horizontal: Dimensions.paddingSizeHorizontal * .5,
        ),
        itemBuilder: (context, index) {
          CartItem data = controller.cartIndexModel.cartItems[index];
          Map<dynamic, dynamic> serializedData = phpDeserialize(data.attributes);

          print(serializedData);

          return Obx(() => ShoppingCardCardWidget(
              isExpansion: controller.selectedIndex.value == index,
              title: data.itemName,
              subTitle: serializedData["address"],
              price: '£0',
              date: DateFormat('EEEE d, MMMM').format(data.createdAt),
              contactDetails: '',
              name: serializedData["new_contact_name"],
              phoneNumber: serializedData["new_contact_number"],
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
        itemCount: controller.cartIndexModel.cartItems.length);
  }
}



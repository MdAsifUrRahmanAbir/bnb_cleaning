import 'package:bnb_clean/backend/utils/custom_loading_api.dart';
import 'package:bnb_clean/backend/utils/no_data_widget.dart';
import 'package:intl/intl.dart';

import '../../../backend/model/my_property/cart_index_model.dart';
import '../../../controller/bottom_nav/cart_details_controller.dart';
import '../../../controller/bottom_nav/shopping_cart_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/strings.dart';
import '../../../widgets/dialog_helper.dart';
import 'cart_detail/cart_detail_screen.dart';
import 'shoping_cart_card_widget.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({super.key});
  final controller = Get.put(ShoppingCartController());
  final cartDetails = Get.put(CartDetailsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading
        ? const CustomLoadingAPI()
        : controller.cartIndexModel.carts.isEmpty
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
          Cart data = controller.cartIndexModel.carts[index];
          // Map<dynamic, dynamic> serializedData = phpDeserialize(data.attributes);

          // print(serializedData);


          return Obx(() => ShoppingCardCardWidget(
            isLoading: cartDetails.isDateUpdateLoading,
              disabledDates:
                  parseDates(controller.cartIndexModel.dateData.dateValue),
              isExpansion: controller.selectedIndex.value == index,
              title: data.property.identifier,
              subTitle: data.property.address,
              price: '£0',
              date: DateFormat('EEEE, d MMMM yyyy').format(data.createdAt),
              contactDetails: data.property.description,
              name: data.property.newContactName,
              phoneNumber: data.property.newContactNumber,
              onNext: (DateTime date) {
                // controller.selectedIndex.value = -1;

                controller.orderId = data.id;
                controller.propertyName = data.property.identifier;
                controller.selectedDate = DateFormat('yyyy-MM-dd').format(date);
                controller.selectedDateTime.value = date;

                cartDetails
                    .cartDateUpdateProcess(data.id, DateFormat('yyyy-MM-dd HH:mm:ss').format(date))
                    .then((value) {
                  cartDetails.initializeServices();
                  Get.to(CartDetailScreen(
                    title: data.property.identifier,
                    subTitle: data.property.address,
                    price: '£0',
                    date: DateFormat('EEEE, d MMMM yyyy').format(data.createdAt),
                    contactDetails: data.property.description,
                    name: data.property.newContactName,
                    phoneNumber: data.property.newContactNumber,
                    initialDate: date,
                    id: data.id.toString(),
                  ));
                });
                controller.selectedIndex.value = -1;

              },
              onEdit: () {
                if (controller.selectedIndex.value != index) {
                  controller.selectedIndex.value = index;
                } else {
                  controller.selectedIndex.value = -1;
                }
              },
              onDelete: () {
                DialogHelper.showAlertDialog(context,
                    title: Strings.delete,
                    isLoading: controller.isDeleteLoading,
                    content: Strings.areYouSure, onTap: () async {
                  controller.cartDeleteProcess(data.id);
                });
              }));
        },
        separatorBuilder: (_, i) => verticalSpace(5),
        itemCount: controller.cartIndexModel.carts.length);
  }
}

List<DateTime> parseDates(String dates) {
  // Step 1: Remove extra slashes and quotes
  dates = dates.replaceAll('\\\"', '').replaceAll('\"', '');

  // Step 2: Split the string by commas to get each date as String
  List<String> dateList = dates.split(',');

  // Step 3: Convert each string date to DateTime object and return the list
  return dateList
      .map((date) => DateTime.parse(date.split('-').reversed.join('-')))
      .toList();
}

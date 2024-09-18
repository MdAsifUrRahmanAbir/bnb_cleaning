import '../../../../utils/basic_screen_imports.dart';
import '../shoping_cart_card_widget.dart';

class CartDetailScreen extends StatelessWidget {
  const CartDetailScreen(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.date,
      required this.contactDetails,
      required this.name,
      required this.phoneNumber,
      required this.initialDate});

  final String title, subTitle, price, date, contactDetails, name, phoneNumber;
  final DateTime initialDate;
  // final controller = Get.find<PropertiesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PrimaryAppBar(
          title: "",
        ),
        body:
        SafeArea(child: ListView(
          children: [
            ShoppingCardCardWidget(
              initialDate: initialDate,
              isExpansion: true,
              title: title,
              subTitle: subTitle,
              price: price,
              date: date,
              contactDetails: contactDetails,
              name: name,
              phoneNumber: phoneNumber,
            ),

          ],
        )));
  }
}

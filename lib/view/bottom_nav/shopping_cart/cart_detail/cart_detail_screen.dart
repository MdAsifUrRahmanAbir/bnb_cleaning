import '../../../../controller/bottom_nav/price_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/strings.dart';
import '../shoping_cart_card_widget.dart';
import 'add_substract_widget.dart';

class CartDetailScreen extends StatelessWidget {
  CartDetailScreen(
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
  final controller = Get.find<PriceController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PrimaryAppBar(
          title: "",
        ),
        body: SafeArea(
            child: ListView(
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
            ExpansionTile(
                title: TitleHeading2Widget(text: Strings.airbnbCleanings),
                children: [
                  Column(
                    children: List.generate(
                        controller.priceListModel.airbnbCleanings.length,
                        (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: crossStart,
                                      children: [
                                        TitleHeading3Widget(
                                            text: controller.priceListModel
                                                .airbnbCleanings[index].title),
                                        TitleHeading4Widget(
                                            text:
                                                "£${controller.priceListModel.airbnbCleanings[index].price.toStringAsFixed(2)}"),
                                      ],
                                    ),
                                  ),
                                  AddSubtractWidget(
                                    initialValue: 0,
                                    onChanged: (int value) {},
                                  )
                                ],
                              ),
                            )),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width * .4,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: TitleHeading2Widget(
                        text: Strings.next, color: CustomColor.whiteColor),
                  ),
                  verticalSpace(10),
                ]),
            ExpansionTile(
                title: TitleHeading2Widget(text: Strings.linenHires),
                children: [
                  Column(
                    children: List.generate(
                        controller.priceListModel.linenHires.length,
                        (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: crossStart,
                                      children: [
                                        TitleHeading3Widget(
                                            text: controller.priceListModel
                                                .linenHires[index].title),
                                        TitleHeading4Widget(
                                            text:
                                                "£${controller.priceListModel.linenHires[index].price.toStringAsFixed(2)}"),
                                      ],
                                    ),
                                  ),
                                  AddSubtractWidget(
                                    initialValue: 0,
                                    onChanged: (int value) {},
                                  )
                                ],
                              ),
                            )),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width * .4,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: TitleHeading2Widget(
                        text: Strings.next, color: CustomColor.whiteColor),
                  ),
                  verticalSpace(10),
                ]),
            ExpansionTile(
                title: TitleHeading2Widget(text: Strings.midStayShortLetClean),
                children: [
                  Column(
                    children: List.generate(
                        controller.priceListModel.midCleanings.length,
                        (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: crossStart,
                                      children: [
                                        TitleHeading3Widget(
                                            text: controller.priceListModel
                                                .midCleanings[index].title),
                                        TitleHeading4Widget(
                                            text:
                                                "£${controller.priceListModel.midCleanings[index].price.toStringAsFixed(2)}"),
                                      ],
                                    ),
                                  ),
                                  AddSubtractWidget(
                                    initialValue: 0,
                                    onChanged: (int value) {},
                                  )
                                ],
                              ),
                            )),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width * .4,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: TitleHeading2Widget(
                        text: Strings.next, color: CustomColor.whiteColor),
                  ),
                  verticalSpace(10),
                ]),
            ExpansionTile(
                title: TitleHeading2Widget(text: Strings.products),
                children: [
                  Column(
                    children: List.generate(
                        controller.priceListModel.products.length,
                        (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: crossStart,
                                      children: [
                                        TitleHeading3Widget(
                                            text: controller.priceListModel
                                                .products[index].name),
                                        TitleHeading4Widget(
                                            text:
                                                "£${controller.priceListModel.products[index].price}"),
                                      ],
                                    ),
                                  ),
                                  AddSubtractWidget(
                                    initialValue: 0,
                                    onChanged: (int value) {},
                                  )
                                ],
                              ),
                            )),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width * .4,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: TitleHeading2Widget(
                        text: Strings.next, color: CustomColor.whiteColor),
                  ),
                  verticalSpace(10),
                ]),
            ExpansionTile(
                title: TitleHeading2Widget(text: Strings.bundles),
                children: [
                  Column(
                    children: List.generate(
                        controller.priceListModel.bundles.length,
                        (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: crossStart,
                                      children: [
                                        TitleHeading3Widget(
                                            text: controller.priceListModel
                                                .bundles[index].name),
                                        TitleHeading4Widget(
                                            text:
                                                "£${controller.priceListModel.bundles[index].price}"),
                                      ],
                                    ),
                                  ),
                                  AddSubtractWidget(
                                    initialValue: 0,
                                    onChanged: (int value) {},
                                  )
                                ],
                              ),
                            )),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width * .4,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: TitleHeading2Widget(
                        text: Strings.next, color: CustomColor.whiteColor),
                  ),
                  verticalSpace(10),
                ]),
          ],
        )));
  }
}

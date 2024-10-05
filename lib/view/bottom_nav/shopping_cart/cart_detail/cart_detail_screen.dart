import 'package:bnb_clean/backend/utils/custom_snackbar.dart';

import '../../../../controller/bottom_nav/cart_details_controller.dart';
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
  final controller = Get.put(CartDetailsController());
  final priceController = Get.find<PriceController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PrimaryAppBar(
          title: "",
          // actions: [IconButton(onPressed: onPressed, icon: icon)],
        ),
        body: Obx(() => SafeArea(
                child: ListView(
              children: [
                ShoppingCardCardWidget(
                  initialDate: initialDate,
                  isExpansion: true,
                  title: title,
                  subTitle: subTitle,
                  price: "£${controller.totalPrice.toStringAsFixed(2)}",
                  date: date,
                  contactDetails: contactDetails,
                  name: name,
                  phoneNumber: phoneNumber,
                ),
                _airBnbTile(context),
                _lineHireTile(context),
                _midStayTile(context),
                _proAndBundleTile(context),
                _othersTile(context),
                Visibility(
                  visible: controller.submitEnable.value,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PrimaryButton(
                      title: Strings.confirm,
                      onPressed: () {
                        // if(controller.onlyLineSelected == 0){
                        //   if(controller.totalPrice.value >= 40){
                        //     // continue
                        //   }else{
                        //     CustomSnackBar.error("For Line Hire minimum value is 40 Euro");
                        //   }
                        // }
                      },
                    ),
                  ),
                )
              ],
            ))));
  }

  _othersTile(BuildContext context) {
    return ExpansionTile(
        title: TitleHeading2Widget(text: Strings.optionalExtras),
        enabled: controller.otherServiceEnable.value,
        children: [
          Column(
            children: List.generate(
                priceController.priceListModel.bundles.length,
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
                                    text: priceController
                                        .priceListModel.bundles[index].name),
                                TitleHeading4Widget(
                                    text:
                                        "£${priceController.priceListModel.bundles[index].price}"),
                              ],
                            ),
                          ),
                          AddSubtractWidget(
                            initialValue: 0,
                            onChanged: (Map value) {
                              controller.optionalsArray[index] = value["qty"];
                              if (value["qty"] > 0) {
                                controller.optionalsEnable.value = true;
                              }
                              if (value["type"] == "add") {
                                controller.totalPrice.value += double.parse(
                                    priceController
                                        .priceListModel.bundles[index].price);
                              } else {
                                controller.totalPrice.value -= double.parse(
                                    priceController
                                        .priceListModel.bundles[index].price);
                              }
                            },
                          )
                        ],
                      ),
                    )),
          ),
          Visibility(
            visible: controller.optionalsEnable.value,
            child: InkWell(
              onTap: () {
                for (var i = 0; i < controller.optionalsArray.length; i++) {
                  if (controller.optionalsArray[i] != 0) {
                    controller.optionalsName
                        .add(priceController.priceListModel.bundles[i].name);
                    controller.optionalsPrice
                        .add(priceController.priceListModel.bundles[i].price);
                    controller.optionalsQty.add(controller.optionalsArray[i]);
                  }
                }
                controller.optionalsUpdateProcess();
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width * .4,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: TitleHeading2Widget(
                    text: Strings.next, color: CustomColor.whiteColor),
              ),
            ),
          ),
          verticalSpace(10),
        ]);
  }

  _proAndBundleTile(BuildContext context) {
    return ExpansionTile(
        title: TitleHeading2Widget(text: Strings.productsAndBundles),
        enabled: controller.productAndBundleEnable.value,
        children: [
          Column(
            children: List.generate(
                priceController.priceListModel.products.length,
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
                                    text: priceController
                                        .priceListModel.products[index].name),
                                TitleHeading4Widget(
                                    text:
                                        "£${priceController.priceListModel.products[index].price}"),
                              ],
                            ),
                          ),
                          AddSubtractWidget(
                            initialValue: 0,
                            onChanged: (Map value) {
                              controller.productArray[index] = value["qty"];
                              if (value["qty"] > 0) {
                                controller.proAndBundleEnable.value = true;
                              }
                              if (value["type"] == "add") {
                                controller.totalPrice.value += double.parse(
                                    priceController
                                        .priceListModel.products[index].price);
                              } else {
                                controller.totalPrice.value -= double.parse(
                                    priceController
                                        .priceListModel.products[index].price);
                              }
                            },
                          )
                        ],
                      ),
                    )),
          ),
          // Column(
          //   children: List.generate(
          //       priceController.priceListModel.bundles.length,
          //           (index) => Padding(
          //         padding: const EdgeInsets.symmetric(
          //             horizontal: 12, vertical: 4),
          //         child: Row(
          //           children: [
          //             Expanded(
          //               child: Column(
          //                 crossAxisAlignment: crossStart,
          //                 children: [
          //                   TitleHeading3Widget(
          //                       text: priceController
          //                           .priceListModel.bundles[index].name),
          //                   TitleHeading4Widget(
          //                       text:
          //                       "£${priceController.priceListModel.bundles[index].price}"),
          //                 ],
          //               ),
          //             ),
          //             AddSubtractWidget(
          //               initialValue: 0,
          //               onChanged: (int value) {},
          //             )
          //           ],
          //         ),
          //       )),
          // ),
          Visibility(
            visible: controller.proAndBundleEnable.value,
            child: InkWell(
              onTap: () {
                for (var i = 0; i < controller.productArray.length; i++) {
                  if (controller.productArray[i] != 0) {
                    controller.productAndBundlePrice
                        .add(priceController.priceListModel.products[i].price);
                    controller.productAndBundleName
                        .add(priceController.priceListModel.products[i].name);
                    controller.productAndBundleQty.add(controller.productArray[i]);
                  }
                }
                controller.productAndBundleUpdateProcess();
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width * .4,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: TitleHeading2Widget(
                    text: Strings.next, color: CustomColor.whiteColor),
              ),
            ),
          ),
          verticalSpace(10),
        ]);
  }

  _midStayTile(BuildContext context) {
    return ExpansionTile(
        title: TitleHeading2Widget(text: Strings.midStayShortLetClean),
        enabled: controller.midstayEnable.value,
        children: [
          Column(
            children: List.generate(
                priceController.priceListModel.midCleanings.length,
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
                                    text: priceController.priceListModel
                                        .midCleanings[index].title),
                                TitleHeading4Widget(
                                    text:
                                        "£${priceController.priceListModel.midCleanings[index].price.toStringAsFixed(2)}"),
                              ],
                            ),
                          ),
                          AddSubtractWidget(
                            initialValue: 0,
                            onChanged: (Map value) {
                              controller.midStayArray[index] = value["qty"];

                              if (value["qty"] > 0) {
                                controller.midStayEnable.value = true;
                              }

                              if (value["type"] == "add") {
                                controller.totalPrice.value += priceController
                                    .priceListModel.midCleanings[index].price;
                              } else {
                                controller.totalPrice.value -= priceController
                                    .priceListModel.midCleanings[index].price;
                              }
                            },
                          )
                        ],
                      ),
                    )),
          ),
          Visibility(
            visible: controller.midStayEnable.value,
            child: InkWell(
              onTap: () {
                for (var i = 0; i < controller.midStayArray.length; i++) {
                  if (controller.midStayArray[i] != 0) {
                    controller.midStayPrice.add(
                        priceController.priceListModel.midCleanings[i].price);
                    controller.midStayName.add(
                        priceController.priceListModel.midCleanings[i].title);
                    controller.midStayQty.add(controller.midStayArray[i]);
                  }
                }
                controller.onMidstaySelected(true);
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width * .4,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: TitleHeading2Widget(
                    text: Strings.next, color: CustomColor.whiteColor),
              ),
            ),
          ),
          verticalSpace(10),
        ]);
  }

  _lineHireTile(BuildContext context) {
    return ExpansionTile(
        title: TitleHeading2Widget(text: Strings.linenHires),
        enabled: controller.lineHireEnable.value,
        children: [
          Column(
            children: List.generate(
                priceController.priceListModel.linenHires.length,
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
                                    text: priceController.priceListModel
                                        .linenHires[index].title),
                                TitleHeading4Widget(
                                    text:
                                        "£${priceController.priceListModel.linenHires[index].price.toStringAsFixed(2)}"),
                              ],
                            ),
                          ),
                          AddSubtractWidget(
                            initialValue: 0,
                            onChanged: (Map value) {
                              controller.lineHireArray[index] = value["qty"];

                              if (value["qty"] > 0) {
                                controller.lineEnable.value = true;
                              }
                              if (value["type"] == "add") {
                                controller.totalPrice.value += priceController
                                    .priceListModel.linenHires[index].price;
                              } else {
                                controller.totalPrice.value -= priceController
                                    .priceListModel.linenHires[index].price;
                              }
                            },
                          )
                        ],
                      ),
                    )),
          ),
          Visibility(
            visible: controller.lineEnable.value,
            child: InkWell(
              onTap: () {
                if(controller.onlyLineSelected == 0){
                  if(controller.totalPrice.value >= 40){
                    for (var i = 0; i < controller.lineHireArray.length; i++) {
                      if (controller.lineHireArray[i] != 0) {
                        controller.lineHirePrice.add(
                            priceController.priceListModel.linenHires[i].price);
                        controller.lineHireName.add(
                            priceController.priceListModel.linenHires[i].title);
                        controller.lineHireQty.add(controller.lineHireArray[i]);
                      }
                    }
                    controller.onLineHireSelected(true);
                  }else{
                    CustomSnackBar.error("For Line Hire minimum value is 40 Euro");
                  }
                }else{
                  for (var i = 0; i < controller.lineHireArray.length; i++) {
                    if (controller.lineHireArray[i] != 0) {
                      controller.lineHirePrice.add(
                          priceController.priceListModel.linenHires[i].price);
                      controller.lineHireName.add(
                          priceController.priceListModel.linenHires[i].title);
                      controller.lineHireQty.add(controller.lineHireArray[i]);
                    }
                  }
                  controller.onLineHireSelected(true);
                }


              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width * .4,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: TitleHeading2Widget(
                    text: Strings.next, color: CustomColor.whiteColor),
              ),
            ),
          ),
          verticalSpace(10),
        ]);
  }

  _airBnbTile(BuildContext context) {
    return ExpansionTile(
        title: TitleHeading2Widget(text: Strings.airbnbCleanings),
        enabled: controller.bnbServiceEnable.value,
        // enabled: false,
        children: [
          Column(
            children: List.generate(
                priceController.priceListModel.airbnbCleanings.length,
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
                                    text: priceController.priceListModel
                                        .airbnbCleanings[index].title),
                                TitleHeading4Widget(
                                    text:
                                        "£${priceController.priceListModel.airbnbCleanings[index].price.toStringAsFixed(2)}"),
                              ],
                            ),
                          ),
                          AddSubtractWidget(
                            initialValue: 0,
                            onChanged: (Map value) {
                              controller.airbnbArray[index] = value["qty"];
                              print("CHECK -- ");
                              print(controller.airbnbArray[index]);
                              print(value["qty"]);
                              print(controller.airbnbArray);
                              if (value["qty"] > 0) {
                                controller.airbnbEnable.value = true;
                              }
                              // if(value["qty"].toInt() >= 0){
                              if (value["type"] == "add") {
                                controller.totalPrice.value += priceController
                                    .priceListModel
                                    .airbnbCleanings[index]
                                    .price;
                              } else {
                                controller.totalPrice.value -= priceController
                                    .priceListModel
                                    .airbnbCleanings[index]
                                    .price;
                              }
                              // }
                            },
                          )
                        ],
                      ),
                    )),
          ),
          Visibility(
            visible: controller.airbnbEnable.value,
            child: InkWell(
              onTap: () {
                print(controller.airbnbArray);

                for (var i = 0; i < controller.airbnbArray.length; i++) {
                  if (controller.airbnbArray[i] != 0) {
                    controller.airbnbPrice.add(priceController
                        .priceListModel.airbnbCleanings[i].price);
                    controller.airbnbName.add(priceController
                        .priceListModel.airbnbCleanings[i].title);
                    controller.airbnbQty.add(controller.airbnbArray[i]);
                  }
                }
                controller.onAirbnbSelected(true);
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width * .4,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: TitleHeading2Widget(
                    text: Strings.next, color: CustomColor.whiteColor),
              ),
            ),
          ),
          verticalSpace(10),
        ]);
  }
}

import 'package:bnb_clean/backend/utils/no_data_widget.dart';
import 'package:intl/intl.dart';

import '../../backend/model/order/my_order_model.dart';
import '../../backend/utils/custom_loading_api.dart';
import '../../controller/bottom_nav/order_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/strings.dart';
import '../../widgets/text_labels/title_heading5_widget.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key, required this.appTitle, required this.endPoint});

  final String appTitle, endPoint;

  final controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    controller.myOrderProcess(endPoint);

    return Scaffold(
        appBar: PrimaryAppBar(title: appTitle),
        body: Obx(() => controller.isLoading
            ? const CustomLoadingAPI()
            : SafeArea(
                child: controller.myOrderModel.data.isEmpty
                    ? const NoDataWidget()
                    : ListView.separated(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSizeHorizontal * .5,
                            vertical: Dimensions.paddingSizeVertical * .3),
                        itemBuilder: (context, index) {
                          Datum data = controller.myOrderModel.data[index];
                          return _listTile(context, data, index);
                        },
                        separatorBuilder: (context, index) => verticalSpace(7),
                        itemCount: controller.myOrderModel.data.length))));
  }

  _listTile(BuildContext context, Datum data, int index) {
    double total = 0;
    for (var e in data.details) {
      debugPrint(e.itemName);
      debugPrint(e.price);
      debugPrint(e.qty);
      debugPrint("--------------");
      total = total+ double.parse(e.price);
    }

    double calTotal = 0;
    for (var e in data.details) {
      calTotal = calTotal + (double.parse(e.price) * int.parse(e.qty));
    }
    print(calTotal);
    return Card(
      color: CustomColor.secondaryLightColor.withOpacity(.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      child: Obx(() => InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              if (controller.selectedIndex.value != index) {
                controller.selectedIndex.value = index;
              } else {
                controller.selectedIndex.value = -1;
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: mainSpaceBet,
                    children: [
                      TitleHeading5Widget(
                        text: DateFormat('EEEE, d MMMM yyyy')
                            .format(data.orderDate),
                        textAlign: TextAlign.center,
                      ),
                      TitleHeading3Widget(
                        text: "£${data.total.toStringAsFixed(2)}",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: crossStart,
                    children: [
                      Icon(
                        Icons.apartment,
                        size: 50.0,
                        color: Theme.of(context).primaryColor,
                      ),
                      horizontalSpace(5),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: crossStart,
                          children: [
                            TitleHeading3Widget(
                              text: data.propertyName,
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                            verticalSpace(4.0),
                            TitleHeading5Widget(
                              text: data.orderStatus,
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: controller.selectedIndex.value == index,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Row(
                          children: [
                            Expanded(
                                child: TitleHeading3Widget(text: Strings.name)),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: mainSpaceBet,
                                children: [
                                  TitleHeading3Widget(text: Strings.quantity),
                                  TitleHeading3Widget(text: Strings.price),
                                ],
                              ),
                            ),
                          ],
                        ),
                        ...List.generate(data.details.length, (i) {
                          return Row(
                            mainAxisAlignment: mainSpaceBet,
                            children: [
                              Expanded(
                                  child: TitleHeading4Widget(
                                      text: data.details[i].itemName)),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 26, right: 10),
                                  child: Row(
                                    mainAxisAlignment: mainSpaceBet,
                                    children: [
                                      TitleHeading4Widget(
                                          text: data.details[i].qty),
                                      TitleHeading4Widget(
                                          text: "£${data.details[i].price}"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                        if(data.total > calTotal) ...[ const Divider(),
                        TitleHeading4Widget(
                            text: "As the selected date is today or Sunday, 20% extra has been applied over the payment.",
                            color: Colors.red,)
                      ]

                      ]),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

import 'package:bnb_clean/backend/utils/custom_loading_api.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:intl/intl.dart';

import '../../../../backend/model/order/my_order_model.dart';
import '../../../../controller/bottom_nav/cart_details_controller.dart';
import '../../../../controller/bottom_nav/order_controller.dart';
import '../../../../controller/bottom_nav/stripe_payment_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/strings.dart';
import '../../../../widgets/text_labels/title_heading5_widget.dart';

class ReorderStripePaymentScreen extends StatefulWidget {
  const ReorderStripePaymentScreen({super.key});

  @override
  State<ReorderStripePaymentScreen> createState() => _ReorderStripePaymentScreenState();
}

class _ReorderStripePaymentScreenState extends State<ReorderStripePaymentScreen> {
  final controller = Get.put(StripePaymentController());

  late final DateTime selectedDate;
  late final List<Detail> items;
  late final String orderId;

  @override
  void initState() {
    orderId = Get.arguments.toString();
    selectedDate = Get.find<OrderController>().selectedDate.value!;
    
    final order = Get.find<OrderController>().myOrderModel.data.firstWhere(
      (element) => element.id.toString() == orderId,
    );
    items = order.details;
    debugPrint("Reorder items count: ${items.length}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double extra = (checkDate(selectedDate) ? (Get.find<CartDetailsController>().totalPrice.value * 20/100): 0);
    double price = Get.find<CartDetailsController>().totalPrice.value;
    double totalPrice = price + extra;
    return Scaffold(
        appBar: const PrimaryAppBar(
          title: "",
        ),
        body: SafeArea(
            child: Form(
          key: controller.formKey,
          child: ListView(
              padding: EdgeInsets.only(
                top: Dimensions.paddingSizeVertical * .5,
                bottom: Dimensions.paddingSizeVertical * .5,
                left: Dimensions.paddingSizeHorizontal * .5,
                right: Dimensions.paddingSizeHorizontal * .5,
              ),
              children: [

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                    color: Theme.of(context).primaryColor.withOpacity(.2)
                  ),
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
                    ...List.generate(items.length, (i) {
                      final itemPrice = double.tryParse(items[i].price) ?? 0.0;
                      return Row(
                        mainAxisAlignment: mainSpaceBet,
                        children: [
                          Expanded(
                              child: TitleHeading4Widget(
                                  text: items[i].itemName)),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 26, right: 10),
                              child: Row(
                                mainAxisAlignment: mainSpaceBet,
                                children: [
                                  TitleHeading4Widget(
                                      text: items[i].qty.toString()),
                                  TitleHeading4Widget(
                                      text: "£${itemPrice.toStringAsFixed(2)}"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ]),
                ),

                Visibility(
                    visible: checkDate(selectedDate),
                    child: Container(
                      padding: const EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(.1),
                        borderRadius: BorderRadius.circular(Dimensions.radius),
                      ),
                      child: Column(
                        crossAxisAlignment: crossStart,
                        children: [
                          TitleHeading4Widget(
                            text: "Same day and Sunday appointments will incur a 20% surcharge.",
                            color: Theme.of(context).primaryColor,
                          ),
                          verticalSpace(5),
                          TitleHeading5Widget(
                            text: "£${price.toStringAsFixed(2)} + £${extra.toStringAsFixed(2)} (20%) = £${totalPrice.toStringAsFixed(2)}",
                          ),
                        ],
                      ),
                    )
                ),

                verticalSpace(12),

                CardField(
                  onCardChanged: (card) {
                    debugPrint("--");
                    debugPrint(card.toString());
                  },
                ),
                verticalSpace(Dimensions.marginBetweenInputBox),
                Obx(() => controller.isLoading
                    ? const CustomLoadingAPI()
                    : PrimaryButton(
                        title: "${Strings.payNow} (£${totalPrice.toStringAsFixed(2)})",
                    onPressed: (){
                      controller.confirmReorder(
                        total: totalPrice.toStringAsFixed(2),
                        orderId: orderId,
                        orderDate: DateFormat('yyyy-MM-dd').format(selectedDate),
                      );
                    }))
              ]),
        )));
  }
}

bool checkDate(DateTime selectedDate) {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);

  // Check if selectedDate is Sunday, today, or tomorrow
  if (selectedDate.weekday == DateTime.sunday ||
      selectedDate == today ) {
    return true;
  }

  return false;
}


String checkDateDescription(DateTime selectedDate) {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime tomorrow = today.add(const Duration(days: 1));

  // Check if selectedDate is Sunday, today, or tomorrow
  if (selectedDate.weekday == DateTime.sunday) {
    return "Sunday";
  } else if (selectedDate == today) {
    return "Today";
  } else if (selectedDate == tomorrow) {
    return "Tomorrow";
  }

  return "None";
}

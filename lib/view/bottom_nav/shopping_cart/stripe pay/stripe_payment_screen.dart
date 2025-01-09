import 'package:bnb_clean/backend/utils/custom_loading_api.dart';
import 'package:flutter/services.dart';

import '../../../../backend/model/my_property/cart_index_model.dart';
import '../../../../controller/bottom_nav/cart_details_controller.dart';
import '../../../../controller/bottom_nav/shopping_cart_controller.dart';
import '../../../../controller/bottom_nav/stripe_payment_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/strings.dart';
import '../../../../widgets/text_labels/title_heading5_widget.dart';

class StripePaymentScreen extends StatefulWidget {
  const StripePaymentScreen({super.key});

  @override
  State<StripePaymentScreen> createState() => _StripePaymentScreenState();
}

class _StripePaymentScreenState extends State<StripePaymentScreen> {
  final controller = Get.put(StripePaymentController());

  final DateTime selectedDate = Get.find<ShoppingCartController>().selectedDateTime.value;
  late final List<Item> items;

  @override
  void initState() {
    items = Get.find<ShoppingCartController>().cartIndexModel.carts.firstWhere((cart) => cart.id.toString() == Get.arguments.toString()).items;
    debugPrint(items.length.toString());
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
                                      text: items[i].itemQty.toString()),
                                  TitleHeading4Widget(
                                      text: "£${items[i].itemPrice.toStringAsFixed(2)}"),
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
                            text: "As the selected date is ${checkDateDescription(selectedDate)}, 20% extra is applied over the payment.",
                            color: Theme.of(context).primaryColor,
                          ),
                          verticalSpace(5),
                          TitleHeading5Widget(
                            text: "£${price.toStringAsFixed(2)} + £${extra.toStringAsFixed(2)} (20%) = £${totalPrice.toStringAsFixed(2)}",
                            // color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    )
                ),

                verticalSpace(12),

                PrimaryTextInputWidget(
                  controller: controller.cardNumberController,
                  labelText: Strings.cardNumber,
                  hint: Strings.cardNumber,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Allow only digits
                    CardNumberInputFormatter(), // Format the card number with spaces
                  ],
                ),
                verticalSpace(Dimensions.marginBetweenInputBox),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryTextInputWidget(
                        controller: controller.expMonthController,
                        labelText: Strings.expMonth,
                        hint: Strings.expMonth,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly, // Only allows digits
                          LengthLimitingTextInputFormatter(2),    // Limit to 2 characters
                        ],
                      ),
                    ),
                    horizontalSpace(10),
                    Expanded(
                      child: PrimaryTextInputWidget(
                        controller: controller.expYearController,
                        labelText: Strings.expYear,
                        hint: Strings.expYear,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly, // Only allows digits
                          LengthLimitingTextInputFormatter(4),
                        ],
                      ),
                    ),
                    horizontalSpace(10),
                    Expanded(
                      child: PrimaryTextInputWidget(
                        controller: controller.cvcController,
                        labelText: Strings.cvc,
                        hint: Strings.cvc,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly, // Only allows digits
                          LengthLimitingTextInputFormatter(4),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace(Dimensions.marginBetweenInputBox),
                Obx(() => controller.isLoading
                    ? const CustomLoadingAPI()
                    : PrimaryButton(
                        title: "${Strings.payNow} (£${totalPrice.toStringAsFixed(2)})", onPressed: (){
                  controller.confirm(totalPrice.toStringAsFixed(2));
                }))
              ]),
        )));
  }
}

bool checkDate(DateTime selectedDate) {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime tomorrow = today.add(const Duration(days: 1));

  // Check if selectedDate is Sunday, today, or tomorrow
  if (selectedDate.weekday == DateTime.sunday ||
      selectedDate == today ||
      selectedDate == tomorrow) {
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


// Custom TextInputFormatter to add spaces after every 4 digits
class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any previous spaces
    String newText = newValue.text.replaceAll(' ', '');

    // Insert spaces after every 4 digits
    String formattedText = '';
    for (int i = 0; i < newText.length; i++) {
      if (i % 4 == 0 && i != 0) {
        formattedText += ' ';
      }
      formattedText += newText[i];
    }

    // Return the new formatted value
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
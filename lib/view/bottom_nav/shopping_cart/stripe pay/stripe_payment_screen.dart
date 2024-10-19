import 'package:bnb_clean/backend/utils/custom_loading_api.dart';
import 'package:flutter/services.dart';

import '../../../../controller/bottom_nav/cart_details_controller.dart';
import '../../../../controller/bottom_nav/stripe_payment_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/strings.dart';

class StripePaymentScreen extends StatelessWidget {
  StripePaymentScreen({super.key});

  final controller = Get.put(StripePaymentController());

  @override
  Widget build(BuildContext context) {
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
                        title: "${Strings.payNow} (£${Get.find<CartDetailsController>().totalPrice.value.toStringAsFixed(2)})", onPressed: controller.confirm))
              ]),
        )));
  }
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
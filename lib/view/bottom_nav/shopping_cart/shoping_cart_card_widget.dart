import 'package:bnb_clean/backend/utils/custom_snackbar.dart';
import 'package:bnb_clean/utils/basic_screen_imports.dart';

import '../../../utils/strings.dart';
import '../../../widgets/inputs/primary_date_input_widget.dart';
import '../../../widgets/text_labels/title_heading5_widget.dart';
import '../../../widgets/text_labels/title_value_widget.dart';

class ShoppingCardCardWidget extends StatelessWidget {
  const ShoppingCardCardWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.date,
    this.onEdit,
    this.onDelete,
    this.isExpansion = false,
    required this.contactDetails,
    required this.name,
    required this.phoneNumber,
    this.onNext,
    this.initialDate
  });

  final String title, subTitle, price, date, contactDetails, name, phoneNumber;
  final VoidCallback? onEdit, onDelete;
  final Function(DateTime date)? onNext;
  final bool isExpansion;
  final DateTime? initialDate;

  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;

    return Card(
      color: CustomColor.secondaryLightColor.withOpacity(.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                TitleHeading5Widget(
                  text: date,
                  textAlign: TextAlign.center,
                ),
                TitleHeading3Widget(
                  text: price,
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
                        text: title,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                      verticalSpace(4.0),
                      TitleHeading5Widget(
                        text: subTitle,
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                horizontalSpace(5),
                // const Spacer(),
                Visibility(
                  visible: onEdit != null && onDelete != null,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: onEdit,
                          icon: Icon(Icons.edit,
                              color: Theme.of(context).primaryColor)),
                      IconButton(
                          onPressed: onDelete,
                          icon: Icon(Icons.delete,
                              color: Theme.of(context).primaryColor)),
                    ],
                  ),
                )
              ],
            ),
            Visibility(
              visible: isExpansion,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    PrimaryDateInputWidget(
                      initialDate: initialDate,
                      labelText: Strings.selectDate,
                      optional: Strings.selectDateFirst,
                      onChanged: (DateTime date) {
                        /// todo date catch method
                        debugPrint("✔️✍️ ${date.toString()} ✉");
                        selectedDate = date;
                        // onDateChanged(date);
                      },
                    ),
                    verticalSpace(Dimensions.marginBetweenInputBox),
                    const TitleHeading3Widget(
                        text:
                            "Service is available from 11.00 A.M to 3.00 P.M"),
                    verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
                    TitleAndValueWidget(
                        title: Strings.contactDetails, value: contactDetails),
                    TitleAndValueWidget(title: Strings.name, value: name),
                    TitleAndValueWidget(
                        title: Strings.phone, value: phoneNumber),
                    onNext == null
                        ? const SizedBox.shrink()
                        : PrimaryButton(
                            title: Strings.next,
                            onPressed: () {
                              if (selectedDate == null) {
                                CustomSnackBar.error(Strings.selectDateFirst);
                              } else {
                                debugPrint(
                                    "✔️✍️ Selected Final Date: ${selectedDate.toString()} ✉");
                                onNext!(selectedDate!);
                              }
                            })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

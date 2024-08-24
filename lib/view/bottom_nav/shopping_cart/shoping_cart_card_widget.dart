import 'package:bnb_clean/utils/basic_screen_imports.dart';

import '../../../utils/basic_widget_imports.dart';
import '../../../utils/strings.dart';
import '../../../widgets/inputs/primary_date_input_widget.dart';
import '../../../widgets/text_labels/title_heading5_widget.dart';

class ShoppingCardCardWidget extends StatelessWidget {
  const ShoppingCardCardWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.date,
      required this.onEdit,
      required this.onDelete,
      this.isExpansion = false});

  final String title, subTitle, price, date;
  final VoidCallback onEdit, onDelete;
  final bool isExpansion;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColor.secondaryLightColor.withOpacity(.2),
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
                Row(
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
                      labelText: Strings.selectDate,
                      optional: Strings.selectDateFirst,
                      onChanged: (date) {
                        print(date);
                      },
                    ),
                    verticalSpace(Dimensions.marginBetweenInputBox),
                    const TitleHeading3Widget(text: "Service is available from 11.00 A.M to 3.00 P.M"),
                    verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
                    Row(
                      children: [
                        TitleHeading4Widget(text: Strings.contactDetails),
                        horizontalSpace(5),
                        TitleHeading4Widget(text: "...."),
                      ],
                    ),
                    verticalSpace(Dimensions.marginBetweenInputTitleAndBox),

                    Row(
                      children: [
                        TitleHeading4Widget(text: Strings.name),
                        horizontalSpace(5),
                        TitleHeading4Widget(text: "Abir"),
                      ],
                    ),

                    verticalSpace(Dimensions.marginBetweenInputTitleAndBox),

                    Row(
                      children: [
                        TitleHeading4Widget(text: Strings.phone),
                        horizontalSpace(5),
                        TitleHeading4Widget(text: "+8801877348044"),
                      ],
                    ),

                    verticalSpace(Dimensions.marginBetweenInputTitleAndBox),

                    PrimaryButton(title: Strings.confirm, onPressed: (){})
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

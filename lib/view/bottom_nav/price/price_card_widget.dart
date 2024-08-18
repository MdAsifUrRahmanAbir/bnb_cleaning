
import '../../../utils/basic_widget_imports.dart';
import '../../../widgets/text_labels/title_heading5_widget.dart';

class PriceCardWidget extends StatelessWidget {
  const PriceCardWidget({super.key, required this.title, required this.subTitle, required this.price, required this.vat});

  final String title, subTitle, price, vat;

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
                  text: vat,
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
                Container(
                  height: 80,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius)
                  ),
                ),
                horizontalSpace(5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      TitleHeading3Widget(
                        text: title,
                        // maxLines: 1,
                        // textOverflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                      verticalSpace(4.0),
                      TitleHeading5Widget(
                        text: subTitle,
                        // maxLines: 2,
                        // textOverflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

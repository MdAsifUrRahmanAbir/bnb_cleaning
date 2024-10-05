import '../../../utils/basic_widget_imports.dart';
import '../../../utils/strings.dart';
import '../../../widgets/text_labels/title_heading5_widget.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.details,
      required this.onTapCart,
      required this.onTapEdit});

  final String title, subTitle, details;
  final VoidCallback onTapCart, onTapEdit;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColor.secondaryLightColor.withOpacity(.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).primaryColor
                  )
                ),
                child: GestureDetector(
                  onTap: onTapEdit,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.edit, color: Theme.of(context).primaryColor,),
                  ),
                ).paddingZero,
              ),
            ),
            const SizedBox(height: 8.0),
            Icon(Icons.apartment, color:  Theme.of(context).primaryColor, size: 50.0),
            const SizedBox(height: 8.0),
            TitleHeading2Widget(
              text: title,
              textAlign: TextAlign.center,
              color:  Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 4.0),
            TitleHeading4Widget(
              text: subTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4.0),
            TitleHeading5Widget(
              text: details,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            OutlinedButton(
              onPressed: onTapCart,
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Theme.of(context).primaryColor.withOpacity(.5),
                ),
              ),
              child: TitleHeading4Widget(
                text: Strings.addToCart,
                color:  Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

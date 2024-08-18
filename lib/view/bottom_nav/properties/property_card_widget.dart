import '../../../utils/basic_widget_imports.dart';
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
    return InkWell(
      onTap: onTapCart,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: onTapEdit,
                ),
              ),
              const SizedBox(height: 8.0),
              const Icon(Icons.apartment, size: 50.0),
              const SizedBox(height: 8.0),
              TitleHeading2Widget(
                text: title,
                textAlign: TextAlign.center,
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
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(),
                ),
                child: const TitleHeading4Widget(
                  text: 'Add to Cart',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

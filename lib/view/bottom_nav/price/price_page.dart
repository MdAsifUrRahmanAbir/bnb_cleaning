import '../../../controller/bottom_nav/price_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/text_labels/title_heading5_widget.dart';
import 'price_card_widget.dart';

class PricePage extends StatelessWidget {
  PricePage({super.key});
  final controller = Get.put(PriceController());

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.only(
          top: Dimensions.paddingSizeVertical * .5,
          left: Dimensions.paddingSizeHorizontal * .5,
          right: Dimensions.paddingSizeHorizontal * .5,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: List.generate(controller.type.length,
            (index) => _typeWidget(context, controller.type[index])));
  }

  _typeWidget(BuildContext context, type) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TitleHeading3Widget(text: type),
        verticalSpace(5),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const PriceCardWidget(
                title: 'Single Bed Pack',
                subTitle: '1x single sheet, 1x single duvet cover, 2x pillow cases, 1x hand towel, 1x bath towel',
                price: '£17',
                vat: 'inc. VAT',
              );
            },
            separatorBuilder: (_, i) => verticalSpace(10),
            itemCount: 5)
      ],
    );
  }
}

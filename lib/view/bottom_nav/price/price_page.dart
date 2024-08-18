import '../../../controller/bottom_nav/price_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/text_labels/title_heading5_widget.dart';

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
              return Card(
                elevation: 1,
                color: CustomColor.secondaryLightColor.withOpacity(.2),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * .5)),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 80,
                      color: Theme.of(context).primaryColor,
                    ),
                    horizontalSpace(Dimensions.paddingSizeHorizontal * .5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: crossStart,
                        children: [
                          TitleHeading4Widget(
                            text: "Sample Title $index",
                            fontWeight: FontWeight.w600,
                          ),
                          verticalSpace(4),
                          TitleHeading5Widget(
                            text: "Sample Description $index",
                          ),
                        ],
                      ),
                    ),
                    horizontalSpace(Dimensions.paddingSizeHorizontal * .5),

                    Column(
                      crossAxisAlignment: crossStart,
                      children: [
                        const TitleHeading4Widget(
                          text: "£17",
                          opacity: .8,
                          fontWeight: FontWeight.w600,
                        ),
                        verticalSpace(5),
                        const TitleHeading4Widget(
                          text: "inc. VAT",
                          opacity: .8,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, i) => verticalSpace(10),
            itemCount: 5)
      ],
    );
  }
}

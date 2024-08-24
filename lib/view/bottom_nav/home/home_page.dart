import '../../../controller/bottom_nav/home_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/text_labels/title_heading5_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(HomeController());

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
    return Stack(
      children: [
        Column(
          crossAxisAlignment: crossStart,
          children: [
            TitleHeading4Widget(
              text: type,
              fontWeight: FontWeight.w600,
            ),
            verticalSpace(5),
            SizedBox(
              height: 250,
              child: ListView.separated(
                  // controller: controller.scrollController,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 300,
                      child: Card(
                        color: CustomColor.secondaryLightColor.withOpacity(.2),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: crossStart,
                            children: [
                              Image.asset(
                                'assets/logo/basic_logo.png',
                                height: 100,
                              ), // Update with your image path
                              verticalSpace(
                                  Dimensions.paddingSizeVertical * .5),
                              TitleHeading5Widget(
                                text: "Sample Title $index",
                              ),
                              verticalSpace(4),
                              TitleHeading5Widget(
                                text:
                                    'To be able to place an order, first you need to add a property and fill in the required details',
                                fontSize: Dimensions.headingTextSize6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, i) => verticalSpace(10),
                  itemCount: 5),
            )
          ],
        ),
        Obx(() => Visibility(
              visible: controller.showArrow.value,
              child: const Positioned(
                bottom: 10,
                right: 10,
                child: Icon(
                  Icons.arrow_forward,
                  size: 30.0,
                ),
              ),
            )),
      ],
    );
  }
}

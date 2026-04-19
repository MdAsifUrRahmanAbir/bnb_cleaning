import '../../../controller/bottom_nav/home_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/text_labels/title_heading5_widget.dart';
import '../../../backend/services/api_endpoint.dart';
import '../../../utils/strings.dart';
import '../../drawer_screens/order_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
              padding: EdgeInsets.only(
                top: Dimensions.paddingSizeVertical * .5,
                bottom: Dimensions.paddingSizeVertical * .5,
                left: Dimensions.paddingSizeHorizontal * .5,
                right: Dimensions.paddingSizeHorizontal * .5,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                _myOrdersSection(context),
                ...List.generate(controller.type.length,
                    (index) => _typeWidget(context, controller.type[index])),
              ]),
        ),
      ],
    );
  }

  _typeWidget(BuildContext context, type) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: crossStart,
          children: [
            TitleHeading4Widget(
              text: type["type"],
              fontWeight: FontWeight.w600,
            ),
            verticalSpace(5),
            SizedBox(
              height: 260,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var data = type["list"][index];
                    return SizedBox(
                      width: 300,
                      child: Card(
                        color: CustomColor.secondaryLightColor.withOpacity(.05),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: crossStart,
                            children: [
                              Image.network(
                                data["image"],
                                height: 100,
                                width: 300,
                                fit: BoxFit.fill,
                              ), // Update with your image path
                              data["title"].isEmpty ? const SizedBox.shrink(): Column(
                                children: [
                                  verticalSpace(
                                      Dimensions.paddingSizeVertical * .5),
                                  TitleHeading5Widget(
                                    text: data["title"],
                                  ),
                                ],
                              ),
                              verticalSpace(4),
                              TitleHeading5Widget(
                                text: data["subTitle"],
                                fontSize: Dimensions.headingTextSize6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, i) => verticalSpace(10),
                  itemCount: type["list"].length),
            ),
            verticalSpace(15),
          ],
        ),


        Visibility(
          visible: type["list"].length > 1,
          child: const Positioned(
            bottom: 25,
            right: 10,
            child: CircleAvatar(
              child: Icon(
                Icons.arrow_forward,
                size: 30.0,
              ),
            ),
          ),
        )
      ],
    );
  }

  _myOrdersSection(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TitleHeading4Widget(
          text: Strings.placedOrders,
          fontWeight: FontWeight.w600,
        ),
        verticalSpace(Dimensions.paddingSizeVertical * .5),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: Dimensions.paddingSizeHorizontal * .4,
          mainAxisSpacing: Dimensions.paddingSizeVertical * .4,
          childAspectRatio: 1.5,
          children: [
            _orderCard(
              title: Strings.past,
              icon: Icons.history_rounded,
              onTap: () => Get.to(OrderScreen(
                  appTitle: Strings.past, endPoint: ApiEndpoint.pastOrderURL)),
            ),
            _orderCard(
              title: Strings.today,
              icon: Icons.today_rounded,
              onTap: () => Get.to(OrderScreen(
                  appTitle: Strings.today, endPoint: ApiEndpoint.todayOrderURL)),
            ),
            _orderCard(
              title: Strings.tomorrow,
              icon: Icons.event_available_rounded,
              onTap: () => Get.to(OrderScreen(
                  appTitle: Strings.tomorrow,
                  endPoint: ApiEndpoint.tomorrowOrderURL)),
            ),
            _orderCard(
              title: Strings.future,
              icon: Icons.calendar_month_rounded,
              onTap: () => Get.to(OrderScreen(
                  appTitle: Strings.future,
                  endPoint: ApiEndpoint.futureOrderURL)),
            ),
          ],
        ),
        verticalSpace(Dimensions.paddingSizeVertical),
      ],
    );
  }

  _orderCard(
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
      child: Container(
        decoration: BoxDecoration(
          color: CustomColor.secondaryLightColor.withOpacity(.06),
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
        ),
        child: Column(
          mainAxisAlignment: mainCenter,
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: CustomColor.primaryLightColor.withOpacity(0.12),
              child: Icon(icon, color: CustomColor.primaryLightColor, size: 24),
            ),
            verticalSpace(Dimensions.paddingSizeVertical * 0.4),
            TitleHeading5Widget(
              text: title,
              fontWeight: FontWeight.w600,
              fontSize: Dimensions.headingTextSize6,
            ),
          ],
        ),
      ),
    );
  }
}

import '../../../controller/bottom_nav/home_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/text_labels/title_heading5_widget.dart';
import '../../../backend/services/api_endpoint.dart';
import '../../../utils/strings.dart';
import '../../drawer_screens/order_screen.dart';
import 'dart:ui' as ui;


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
          fontWeight: FontWeight.w700,
        ),
        verticalSpace(Dimensions.paddingSizeVertical * .4),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: Dimensions.paddingSizeHorizontal * .6,
          mainAxisSpacing: Dimensions.paddingSizeVertical * .6,
          childAspectRatio: 1.3,
          children: [
            _OrderCategoryCard(
              title: Strings.past,
              icon: Icons.history_rounded,
              onTap: () => Get.to(OrderScreen(
                  appTitle: Strings.past, endPoint: ApiEndpoint.pastOrderURL)),
            ),
            _OrderCategoryCard(
              title: Strings.today,
              icon: Icons.today_rounded,
              onTap: () => Get.to(OrderScreen(
                  appTitle: Strings.today, endPoint: ApiEndpoint.todayOrderURL)),
            ),
            _OrderCategoryCard(
              title: Strings.tomorrow,
              icon: Icons.event_available_rounded,
              onTap: () => Get.to(OrderScreen(
                  appTitle: Strings.tomorrow,
                  endPoint: ApiEndpoint.tomorrowOrderURL)),
            ),
            _OrderCategoryCard(
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


}

class _OrderCategoryCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _OrderCategoryCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_OrderCategoryCard> createState() => _OrderCategoryCardState();
}

class _OrderCategoryCardState extends State<_OrderCategoryCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                                color: CustomColor.primaryLightColor.withOpacity(1),
                                width: .6,
                              ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(4, 4),
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.9),
                blurRadius: 10,
                offset: const Offset(-4, -4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.4),
                    width: 1.5,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.4),
                      Colors.white.withOpacity(0.1),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            CustomColor.primaryLightColor.withOpacity(0.15),
                            CustomColor.primaryLightColor.withOpacity(0.05),
                          ],
                        ),
                      ),
                      child: Icon(
                        widget.icon,
                        color: CustomColor.primaryLightColor,
                        size: 26,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TitleHeading5Widget(
                      text: widget.title,
                      fontWeight: FontWeight.w600,
                      fontSize: Dimensions.headingTextSize5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


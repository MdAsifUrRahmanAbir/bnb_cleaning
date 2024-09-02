import 'package:bnb_clean/backend/utils/custom_loading_api.dart';

import '../../../backend/model/my_property/property_list_model.dart';
import '../../../backend/utils/no_data_widget.dart';
import '../../../controller/bottom_nav/properties_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/strings.dart';
import 'property_card_widget.dart';

class PropertiesScreen extends StatelessWidget {
  PropertiesScreen({super.key});

  final controller = Get.put(PropertiesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrimaryAppBar(
          title: Strings.properties,
          actions: [
            TextButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.hovered)) {
                    return CustomColor.secondaryLightColor;
                  }
                  return Theme.of(context).primaryColor;
                })),
                onPressed: controller.addPropertiesRoute,
                child: TitleHeading4Widget(text: Strings.addNew))
          ],
        ),
        body: SafeArea(
            child: Obx(
          () => controller.isLoading
              ? const CustomLoadingAPI()
              : controller.myPropertyModel.properties.isEmpty ? const NoDataWidget() : GridView.builder(
                  itemCount: controller.myPropertyModel.properties.length,
                  padding: const EdgeInsets.all(12.0),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400),
                  itemBuilder: (BuildContext context, int index) {
                    Property data = controller.myPropertyModel.properties[index];
                    return PropertyCard(
                      onTapCart: () {},
                      title: data.identifier,
                      subTitle: data.propertyType,
                      details: data.description,
                      onTapEdit: () {
                        Get.toNamed(Routes.editPropertiesScreen);
                      },
                    );
                  },
                ),
        )));
  }
}

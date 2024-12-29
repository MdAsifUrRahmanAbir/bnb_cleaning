import 'package:bnb_clean/backend/utils/custom_loading_api.dart';

import '../../../backend/model/my_property/cart_index_model.dart';
import '../../../backend/model/my_property/property_list_model.dart'
    as property;
// import '../../../backend/static_data.dart';
import '../../../backend/utils/no_data_widget.dart';
import '../../../controller/bottom_nav/edit_properties_controller.dart';
import '../../../controller/bottom_nav/properties_controller.dart';
import '../../../controller/bottom_nav/shopping_cart_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/strings.dart';
import 'property_card_widget.dart';

class PropertiesScreen extends StatelessWidget {
  PropertiesScreen({super.key});

  final controller = Get.put(PropertiesController());
  final updateController = Get.put(UpdatePropertiesController());

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        // appBar: PrimaryAppBar(
        //   title: Strings.properties,
        //   actions: [
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: TextButton(
        //           style: ButtonStyle(backgroundColor:
        //               WidgetStateProperty.resolveWith((states) {
        //             if (states.contains(WidgetState.hovered)) {
        //               return CustomColor.secondaryLightColor;
        //             }
        //             return Theme.of(context).primaryColor;
        //           })),
        //           onPressed: controller.addPropertiesRoute,
        //           child: TitleHeading4Widget(
        //             text: Strings.addNew,
        //             color: CustomColor.whiteColor,
        //           )),
        //     )
        //   ],
        // ),
        // body:
        _bodyWidget();
  }

  _bodyWidget() {
    return SafeArea(
        child: Stack(
      children: [
        Obx(() {
          return controller.isLoading || controller.isCartSaveLoading
              ? const CustomLoadingAPI()
              : controller.isError.value
                  ? const NoDataWidget()
                  : controller.myPropertyModel.properties.isEmpty
                      ? const NoDataWidget()
                      : GridView.builder(
                          itemCount:
                              controller.myPropertyModel.properties.length,
                          padding: const EdgeInsets.all(12.0),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 400),
                          itemBuilder: (BuildContext context, int index) {
                            property.Property data =
                                controller.myPropertyModel.properties[index];

                            List<Cart> cart = Get.find<ShoppingCartController>()
                                .cartIndexModel
                                .carts;

                            RxBool cartAdded = false.obs;

                            for (var i = 0; i < cart.length; i++) {
                              if (data.id.toString() ==
                                  cart[i].propertyId.toString()) {
                                cartAdded.value = true;
                                break;
                              }
                            }

                            return Obx(() => PropertyCard(
                                  cartAdded: cartAdded.value,
                                  onTapCart: () {
                                    controller.cartSaveProcess(
                                        id: data.id.toString(),
                                        name: data.identifier,
                                        price: '',
                                        qty: '1');
                                  },
                                  title: data.identifier,
                                  subTitle: data.propertyType,
                                  details: data.description,
                                  onTapEdit: () {
                                    updateController.propertyId =
                                        data.id.toString();
                                    updateController.propertyNameController
                                        .text = data.identifier;
                                    updateController
                                        .propertyDescriptionController
                                        .text = data.description;
                                    updateController.contactNameController
                                        .text = data.newContactName;
                                    updateController.contactPhoneController
                                        .text = data.newContactNumber;
                                    updateController.addressController.text =
                                        data.address;
                                    updateController.postCodeController.text =
                                        data.postcode;
                                    // updateController.selectedPropertyType.value.title = data.propertyType;
                                    // updateController.selectedPropertyAccess.value.title = data.access;

                                    Get.toNamed(Routes.editPropertiesScreen);
                                  },
                                ));
                          },
                        );
        }),
        Positioned(
          bottom: 10,
          right: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.hovered)) {
                    return CustomColor.secondaryLightColor;
                  }
                  return Theme.of(Get.context!).primaryColor;
                })),
                onPressed: controller.addPropertiesRoute,
                child: TitleHeading4Widget(
                  text: Strings.addNew,
                  color: CustomColor.whiteColor,
                )),
          ),
        )
      ],
    ));
  }
}

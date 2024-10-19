import 'package:bnb_clean/backend/utils/custom_loading_api.dart';

import '../../../backend/model/price_list/price_list_model.dart';
import '../../../controller/bottom_nav/price_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/strings.dart';
import 'price_card_widget.dart';

class PricePage extends StatelessWidget {
  PricePage({super.key});
  final controller = Get.put(PriceController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading
        ? const CustomLoadingAPI()
        : ListView(
            padding: EdgeInsets.only(
              top: Dimensions.paddingSizeVertical * .5,
              left: Dimensions.paddingSizeHorizontal * .5,
              right: Dimensions.paddingSizeHorizontal * .5,
            ),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
                _typeWidget<AirbnbCleaning>(context, Strings.linenHires,
                    controller.priceListModel.linenHires, 1),
                verticalSpace(10),
                _typeWidget<AirbnbCleaning>(context, Strings.airbnbCleanings,
                    controller.priceListModel.airbnbCleanings, 1),
              verticalSpace(10),
              _typeWidget<AirbnbCleaning>(
                    context,
                    Strings.midStayShortLetClean,
                    controller.priceListModel.midCleanings,
                    1),
              verticalSpace(10),
              _typeWidget<Bundle>(context, Strings.products,
                    controller.priceListModel.products, 2),
              verticalSpace(10),

              _typeWidget<Bundle>(context, Strings.bundles,
                    controller.priceListModel.bundles, 2),
              ]));
  }

  _typeWidget<T>(
      BuildContext context, String typeName, List<T?> data, int type) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TitleHeading3Widget(text: typeName),
        verticalSpace(5),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (type == 1) {
                AirbnbCleaning datum = data[index] as AirbnbCleaning;

                return PriceCardWidget(
                  title: datum.title,
                  image: datum.image,
                  subTitle: datum.categoryName.isEmpty
                      ? datum.details
                      : datum.categoryName,
                  price: '£${datum.price.toStringAsFixed(2)}',
                  vat: 'inc. VAT',
                );
              } else {
                Bundle datum = data[index] as Bundle;

                return PriceCardWidget(
                  title: datum.name,
                  image: datum.image,
                  subTitle: datum.details,
                  price: '£${datum.price}',
                  vat: 'inc. VAT',
                );
              }
            },
            separatorBuilder: (_, i) => verticalSpace(10),
            itemCount: data.length)
      ],
    );
  }
}


import 'package:get/get.dart';

import '../../backend/model/price_list/price_list_model.dart';
import '../../backend/services/dashboard_service.dart';

class PriceController extends GetxController with DashboardService{

  @override
  void onInit() {
    priceListProcess();
    super.onInit();
  }

  // List type = [
  //   "Linen Hire",
  //   "Airbnb Cleaning Services",
  //   "Mid Stay Short Let Clean",
  //   "Products",
  //   "Bundles",
  // ];


  /// ------------------------------------- >>
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  List<Bundle> productAndBundle = [];

  late PriceListModel _priceListModel;
  PriceListModel get priceListModel => _priceListModel;

  ///* Get PriceList in process
  Future<PriceListModel> priceListProcess() async {
    _isLoading.value = true;
    update();
    await priceListProcessApi().then((value) {
      _priceListModel = value!;
      productAndBundle = [..._priceListModel.products, ..._priceListModel.bundles];
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _priceListModel;
  }
}

import 'package:get/get.dart';

import '../../backend/model/my_property/cart_index_model.dart';
import '../../backend/services/dashboard_service.dart';

class ShoppingCartController extends GetxController with DashboardService{

  RxInt selectedIndex = (-1).obs;

  @override
  void onInit() {
    cartIndexProcess();
    super.onInit();
  }
  /// ------------------------------------- >>
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;


  late CartIndexModel _cartIndexModel;
  CartIndexModel get cartIndexModel => _cartIndexModel;


  ///* Get CartIndex in process
  Future<CartIndexModel> cartIndexProcess() async {
    _isLoading.value = true;
    update();
    await cartIndexProcessApi().then((value) {
      _cartIndexModel = value!;
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _cartIndexModel;
  }
}
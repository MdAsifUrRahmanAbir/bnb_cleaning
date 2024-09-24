
import 'package:bnb_clean/backend/services/cart_service.dart';
import 'package:get/get.dart';

import '../../backend/model/my_property/cart_index_model.dart';

class ShoppingCartController extends GetxController with CartService{

  RxInt selectedIndex = (-1).obs;

  String propertyName = "";
  String selectedDate = "";
  int orderId = -1;

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
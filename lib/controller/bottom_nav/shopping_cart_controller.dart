
import 'package:bnb_clean/backend/model/common/common_success_model.dart';
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

  /// ------------------------------------- >>
  final _isDeleteLoading = false.obs;
  bool get isDeleteLoading => _isDeleteLoading.value;


  late CommonSuccessModel _cartDeleteModel;
  CommonSuccessModel get cartDeleteModel => _cartDeleteModel;


  ///* Get Cart Delete in process
  Future<CommonSuccessModel> cartDeleteProcess(int id) async {
    _isDeleteLoading.value = true;
    update();
    await cartDeleteProcessApi(id.toString()).then((value) {
      _cartDeleteModel = value!;
      Get.close(1);
      _isDeleteLoading.value = false;
      cartIndexProcess();
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isDeleteLoading.value = false;
    update();
    return _cartDeleteModel;
  }
}
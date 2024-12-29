import 'package:bnb_clean/backend/model/common/common_success_model.dart';
import 'package:bnb_clean/controller/bottom_nav/bottom_nav_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../backend/model/my_property/property_list_model.dart';
import '../../backend/services/dashboard_service.dart';
import '../../routes/routes.dart';
import 'shopping_cart_controller.dart';

class PropertiesController extends GetxController with DashboardService {
  @override
  void onInit() {
    myPropertyProcess();
    super.onInit();
  }

  void addPropertiesRoute() {
    Get.toNamed(Routes.addPropertiesScreen);
  }

  /// ------------------------------------- >>
  final isError = true.obs;
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late MyPropertyModel _myPropertyModel;
  MyPropertyModel get myPropertyModel => _myPropertyModel;

  ///* Get MyProperty in process
  Future<MyPropertyModel> myPropertyProcess() async {
    _isLoading.value = true;
    update();
    await myPropertyProcessApi().then((value) {
      _myPropertyModel = value!;
      _isLoading.value = false;
      isError.value = false;
      update();
    }).catchError((onError) {
      isError.value = true;
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _myPropertyModel;
  }

  /// ------------------------------------- >>
  final _isCartSaveLoading = false.obs;
  bool get isCartSaveLoading => _isCartSaveLoading.value;

  late CommonSuccessModel _cartSaveModel;
  CommonSuccessModel get cartSaveModel => _cartSaveModel;

  ///* CartSave in process
  Future<CommonSuccessModel> cartSaveProcess(
      {required String id,
      required String name,
      required String price,
      required String qty}) async {
    _isCartSaveLoading.value = true;
    update();

    debugPrint("1");

    Map<String, dynamic> inputBody = {};

    await cartSaveProcessApi(body: inputBody, id: id).then((value) {
      _cartSaveModel = value!;
      Get.find<ShoppingCartController>().cartIndexProcess();
      myPropertyProcess();
      Get.find<BottomNavController>().selectedIndex.value = 2;
      _isCartSaveLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isCartSaveLoading.value = false;
    update();
    return _cartSaveModel;
  }
}

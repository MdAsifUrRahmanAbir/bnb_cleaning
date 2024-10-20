import 'package:get/get.dart';

import '../../backend/model/order/my_order_model.dart';
import '../../backend/services/order_service.dart';

class OrderController extends GetxController with OrderService {
  RxInt selectedIndex = (-1).obs;

  /// ------------------------------------- >>
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late MyOrderModel _myOrderModel;
  MyOrderModel get myOrderModel => _myOrderModel;

  ///* Get MyOrder in process
  Future<MyOrderModel> myOrderProcess(String endPoint) async {
    _isLoading.value = true;
    update();
    await myOrderProcessApi(endPoint: endPoint).then((value) {
      _myOrderModel = value!;
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _myOrderModel;
  }
}

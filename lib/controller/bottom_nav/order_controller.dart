import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../backend/model/common/common_success_model.dart';
import '../../backend/model/order/my_order_model.dart';
import '../../backend/services/order_service.dart';
import '../../view/bottom_nav/shopping_cart/stripe pay/stripe_payment_screen.dart';
import 'cart_details_controller.dart';
import 'shopping_cart_controller.dart';

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

  late CommonSuccessModel _reorderProcessModel;
  CommonSuccessModel get reorderProcessModel => _reorderProcessModel;

  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  ///* OthersUpdate in process
  Future<CommonSuccessModel> reorderProcess({
    required String orderId,
    required String total,
    String token = "default_token",
  }) async {
    _isLoading.value = true;
    update();

    Map<String, String> inputBody = {
      "order_id": orderId,
      "order_date": DateFormat('yyyy-MM-dd').format(selectedDate.value!),
      "fullname": "Md Abir",
      "payment_method_id": token,
      "total": total
    };

    await repeatOrderApi(body: inputBody).then((value) async {
      _reorderProcessModel = value!;
      if (_reorderProcessModel.success) {
        // Sync data with payment-related controllers
        if (Get.isRegistered<ShoppingCartController>()) {
          Get.find<ShoppingCartController>().selectedDateTime.value = selectedDate.value!;
        }
        if (Get.isRegistered<CartDetailsController>()) {
          Get.find<CartDetailsController>().totalPrice.value = double.parse(total);
        }

        // Navigate to payment screen
        Get.to(() => const StripePaymentScreen(), arguments: orderId);
      }
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _reorderProcessModel;
  }
}

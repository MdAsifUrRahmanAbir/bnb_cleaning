
import '../model/order/my_order_model.dart';
import '../utils/api_method.dart';
import '../utils/custom_snackbar.dart';
import '../utils/logger.dart';

final log = logger(OrderService);

mixin OrderService{

  ///* Get MyOrder api services
  Future<MyOrderModel?> myOrderProcessApi({required String endPoint}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        endPoint,
      );
      if (mapResponse != null) {
        MyOrderModel result = MyOrderModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from MyOrder api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

}
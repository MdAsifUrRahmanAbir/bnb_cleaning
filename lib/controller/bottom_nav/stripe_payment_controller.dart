import 'package:bnb_clean/backend/model/common/common_success_model.dart';

import '../../backend/services/api_endpoint.dart';
import '../../backend/services/cart_service.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';

import 'package:http/http.dart' as http;

class StripePaymentController extends GetxController with CartService {
  // Controllers for the fields
  final cardNumberController = TextEditingController();
  final expMonthController = TextEditingController();
  final expYearController = TextEditingController();
  final cvcController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void confirm(String total) async {
    if (formKey.currentState!.validate()) {
      await orderProcess(total);
    }
  }

  /// ------------------------------------- >>
  late CommonSuccessModel _orderProcessModel;
  CommonSuccessModel get orderProcessModel => _orderProcessModel;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  ///* OthersUpdate in process
  Future orderProcess(String total) async {
    _isLoading.value = true;
    update();


    Map<String, String> inputBody = {
      // "card_number": cardNumberController.text,
      // "exp_month": expMonthController.text,
      // "exp_year": expYearController.text,
      // "cvc": cvcController.text,
      "token": "87896789897979989iou896",
      "total": total
    };

    await orderProcessApi(body: inputBody).then((value) {
      _orderProcessModel = value!;
      if (_orderProcessModel.success) {
        Get.offAllNamed(Routes.btmScreen);
      }
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _orderProcessModel;
  }
}

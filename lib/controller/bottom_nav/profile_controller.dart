
import 'package:bnb_clean/backend/model/common/common_success_model.dart';
import 'package:bnb_clean/backend/services/dashboard_service.dart';

import '../../utils/basic_screen_imports.dart';

class ProfileController extends GetxController with DashboardService{

  final fullNameController = TextEditingController();
  final companyNameController = TextEditingController();
  final postalCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final additionalInformationController = TextEditingController();

  final emailController = TextEditingController();



  /// ------------------------------------- >>
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;


  late CommonSuccessModel _updateProfileModel;
  CommonSuccessModel get updateProfileModel => _updateProfileModel;


  ///* UpdateProfile in process
  Future<CommonSuccessModel> updateProfileProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'name': fullNameController.text,
      'email': emailController.text,
      // 'info_id': '',
      'phone': phoneNumberController.text,
      'company': companyNameController.text,
      'postal_code': postalCodeController.text
    };

    await updateProfileProcessApi(body: inputBody).then((value) {
      _updateProfileModel = value!;

      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _updateProfileModel;
  }
}
import 'package:bnb_clean/utils/basic_screen_imports.dart';

import '../../backend/model/common/common_success_model.dart';
import '../../backend/services/profile_service.dart';

class ChangePasswordController extends GetxController with ProfileService{
  final oldPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    oldPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  void changePassword() async{
    if(formKey.currentState!.validate()){
      await changePasswordProcess();
    }
  }

  /// ------------------------------------- >>
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late CommonSuccessModel _commonSuccessModel;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  ///* CommonSuccess in process
  Future<CommonSuccessModel> changePasswordProcess() async {
    _isLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      'oldpassword': oldPassword.text,
      'newpassword': newPassword.text,
      'password_confirmation': confirmPassword.text,
    };

    await changePasswordProcessApi(body: inputBody).then((value) {
      _commonSuccessModel = value!;
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _commonSuccessModel;
  }
}
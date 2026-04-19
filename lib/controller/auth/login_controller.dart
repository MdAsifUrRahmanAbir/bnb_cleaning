import 'package:bnb_clean/backend/local_storage/local_storage.dart';
import 'package:bnb_clean/backend/model/common/common_success_model.dart';

import '../../../routes/routes.dart';
import '../../backend/model/auth/login_model.dart';
import '../../backend/services/auth_service.dart';
import '../../utils/basic_screen_imports.dart';

class LoginController extends GetxController with AuthService{
  /// text controllers
  final resetEmailController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /// formKeys
  final formKey = GlobalKey<FormState>();
  RxBool rememberMe = false.obs;

  @override
  void dispose() {
    resetEmailController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() async{
    if(formKey.currentState!.validate()){
      await loginProcess();
    }
  }

  void onChangedInRememberMe(bool? value) {
    rememberMe.value = value!;
    debugPrint("${rememberMe.value} - $value");
    update();
  }

  void clickOnRichText() {
    Get.toNamed(Routes.registrationScreen);
  }

  void forgotPasswordSendLink() {
    forgotPasswordProcess();
  }

  /// ------------------------------------- >>
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late LoginModel _loginModel;
  LoginModel get loginModel => _loginModel;

  ///* Login in process
  Future<LoginModel> loginProcess() async {
    _isLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    await loginProcessApi(body: inputBody).then((value) {
      _loginModel = value!;

      // LocalStorage.isLoginSuccess(isLoggedIn: rememberMe.value);
      LocalStorage.isLoginSuccess(isLoggedIn: true);
      LocalStorage.saveToken(token: _loginModel.token);
      Get.toNamed(Routes.btmScreen);

      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _loginModel;
  }


  /// ------------------------------------- >>
  final _isForgotLoading = false.obs;
  bool get isForgotLoading => _isForgotLoading.value;


  late CommonSuccessModel _forgotPasswordModel;
  CommonSuccessModel get forgotPasswordModel => _forgotPasswordModel;


  ///* ForgotPassword in process
  Future<CommonSuccessModel> forgotPasswordProcess() async {
    _isForgotLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      'email': resetEmailController.text,
    };
    await forgotPasswordProcessApi(body: inputBody).then((value) {
      _forgotPasswordModel = value!;
      Get.close(1);
      _isForgotLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isForgotLoading.value = false;
    update();
    return _forgotPasswordModel;
  }
}
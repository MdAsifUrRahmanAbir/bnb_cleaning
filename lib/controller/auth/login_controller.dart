
import 'package:bnb_cleaning/backend/utils/custom_snackbar.dart';

import '../../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';

class LoginController extends GetxController {

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


  void login() {
    // if(formKey.currentState!.validate()){
      Get.toNamed(Routes.btmScreen);
    // }
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
    CustomSnackBar.toast("Email Send Successfully. Please Check Your Email.");
  }
}
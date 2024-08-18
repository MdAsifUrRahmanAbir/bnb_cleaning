import '../../../routes/routes.dart';
import '../../backend/static_data.dart';
import '../../utils/basic_screen_imports.dart';

class RegistrationController extends GetxController {
  /// text controllers
  final fullNameController = TextEditingController();
  final companyNameController = TextEditingController();
  final postalCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final additionalInformationController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /// formKeys
  final formKey = GlobalKey<FormState>();

  Rx<DropDownUseModel> selectedAreYouData = areYouData.first.obs;
  Rx<DropDownUseModel> selectedService = selectService.first.obs;
  Rx<DropDownUseModel> selectedPropertyType = propertyType.first.obs;
  Rx<DropDownUseModel> selectedPropertyAccess = propertyAccess.first.obs;

  @override
  void dispose() {
    fullNameController.dispose();
    companyNameController.dispose();
    postalCodeController.dispose();
    phoneNumberController.dispose();
    additionalInformationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void register() {
    // if(formKey.currentState!.validate()){
    Get.offAllNamed(Routes.btmScreen);
    // }
  }

  void clickOnRichText() {
    Get.offAllNamed(Routes.loginScreen);
  }

  void next() {
    Get.toNamed(Routes.registrationNextScreen);
    // if (formKey.currentState!.validate()) {
    //   Get.toNamed(Routes.registrationNextScreen);
    // }
  }
}
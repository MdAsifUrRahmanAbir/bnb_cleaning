import 'package:bnb_clean/backend/utils/custom_snackbar.dart';

import '../../../routes/routes.dart';
import '../../backend/model/auth/register_model.dart';
import '../../backend/services/auth_service.dart';
import '../../backend/static_data.dart';
import '../../utils/basic_screen_imports.dart';

class RegistrationController extends GetxController with AuthService {
  /// text controllers
  final fullNameController = TextEditingController();
  final companyNameController = TextEditingController();
  final postalCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final additionalInformationController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  /// formKeys
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  Rx<DropDownUseModel> selectedAreYouData = areYouData.first.obs;
  Rx<DropDownUseModel> selectedService = selectService.first.obs;
  Rx<DropDownUseModel> selectedPropertyType = propertyType.first.obs;
  Rx<DropDownUseModel> selectedPropertyAccess = propertyAccess.first.obs;

  RxString selectNumberOfProperties = numberOfProperties.first.obs;
  RxString selectBookings = require.first.obs;

  @override
  void dispose() {
    fullNameController.dispose();
    companyNameController.dispose();
    postalCodeController.dispose();
    phoneNumberController.dispose();
    additionalInformationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void register() async {
    if (formKey2.currentState!.validate()) {
      if(passwordController.text == confirmPasswordController.text) {
        await registrationProcess();
      }else{
        CustomSnackBar.error("The password confirmation does not match.");
      }
    }
  }

  void clickOnRichText() {
    Get.offAllNamed(Routes.loginScreen);
  }

  void next() {
    if (formKey.currentState!.validate()) {
      Get.toNamed(Routes.registrationNextScreen);
    }
  }

  /// ------------------------------------- >>
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late RegistrationModel _registrationModel;
  RegistrationModel get registrationModel => _registrationModel;

  ///* Registration in process
  Future<RegistrationModel> registrationProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      "fullname": fullNameController.text,
      "phone": phoneNumberController.text,
      "email": emailController.text,
      "are_you": selectedAreYouData.value.title,
      "properties": selectNumberOfProperties.value,
      "service": selectedService.value.title,
      "property_type": selectedPropertyType.value.title,
      "property_access": selectedPropertyAccess.value.title,
      "bookings": selectBookings.value,
      "name": "johndoe",
      "password": passwordController.text,
      "password_confirmation": confirmPasswordController.text,
      "company": companyNameController.text,
      "postal_code": postalCodeController.text,
      "additional_information": additionalInformationController.text
    };

    await registrationProcessApi(body: inputBody).then((value) {
      _registrationModel = value!;

      Get.offAllNamed(Routes.loginScreen);
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _registrationModel;
  }
}

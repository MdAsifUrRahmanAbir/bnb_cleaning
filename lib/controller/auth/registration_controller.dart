import '../../../routes/routes.dart';
import '../../backend/local_storage/local_storage.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/custom_dropdown_widget/custom_dropdown_widget.dart';

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

class DropDownUseModel extends DropdownModel {
  @override
  final String title;

  DropDownUseModel(this.title);
}

List<DropDownUseModel> areYouData = [
  DropDownUseModel("Tenant"),
  DropDownUseModel("Landlord"),
  DropDownUseModel("Property Manager"),
];

List<DropDownUseModel> selectService = [
  DropDownUseModel("Linen hire only"),
  DropDownUseModel("Cleaning + Linen hire"),
];

List<DropDownUseModel> propertyType = [
  DropDownUseModel("Studio flat"),
  DropDownUseModel("1 bed (flat)"),
  DropDownUseModel("1 bed (house)"),
  DropDownUseModel("2 bed 1bath (flat)"),
  DropDownUseModel("2 bed 1bath (house)"),
  DropDownUseModel("2 bed 2 bath (flat)"),
  DropDownUseModel("2 bed 2 bath (house)"),
  DropDownUseModel("3 bed 1 bath (flat)"),
  DropDownUseModel("3 bed 1 bath (house)"),
  DropDownUseModel("3 bed 2 bath (flat)"),
  DropDownUseModel("3 bed 2 bath (house)")
];

List<DropDownUseModel> propertyAccess = [
  DropDownUseModel("Keynest/Keysafe"),
  DropDownUseModel("Lock Box/Digital Lock"),
  DropDownUseModel("Concierge/Porter"),
  DropDownUseModel("Someone on site")
];

List<String> numberOfProperties = ["1", "2-5", "5-10", "10-20", "20-50", "50+"];

List<String> require = [
  "2",
  "3-5",
  "5-10",
  "10+",
];

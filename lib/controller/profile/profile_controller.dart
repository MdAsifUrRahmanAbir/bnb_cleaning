import '../../backend/model/common/common_success_model.dart';
import '../../backend/model/profile/profile_model.dart';
import '../../backend/services/profile_service.dart';
import '../../utils/basic_screen_imports.dart';

class ProfileController extends GetxController with ProfileService {
  final fullNameController = TextEditingController();
  final companyNameController = TextEditingController();
  final postalCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final additionalInformationController = TextEditingController();

  final emailController = TextEditingController();

  @override
  void onInit() {
    profileProcess();
    super.onInit();
  }

  void updateProfile() {
    updateProfileProcess();
  }

  /// ------------------------------------- >>
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late ProfileModel _profileModel;
  ProfileModel get profileModel => _profileModel;

  ///* Get Profile in process
  Future<ProfileModel> profileProcess() async {
    _isLoading.value = true;
    update();
    await profileProcessApi().then((value) {
      _profileModel = value!;

      fullNameController.text = _profileModel.user.name;
      emailController.text = _profileModel.user.email;
      postalCodeController.text = _profileModel.additionalInfo.postalCode;
      companyNameController.text = _profileModel.additionalInfo.company;
      phoneNumberController.text = _profileModel.additionalInfo.phone;


      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _profileModel;
  }

  /// ------------------------------------- >>
  final _isStoreLoading = false.obs;
  bool get isStoreLoading => _isStoreLoading.value;

  late CommonSuccessModel _updateProfileModel;
  CommonSuccessModel get updateProfileModel => _updateProfileModel;

  ///* UpdateProfile in process
  Future<CommonSuccessModel> updateProfileProcess() async {
    _isStoreLoading.value = true;
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

      _isStoreLoading.value = false;
      profileProcess();
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isStoreLoading.value = false;
    update();
    return _updateProfileModel;
  }
}

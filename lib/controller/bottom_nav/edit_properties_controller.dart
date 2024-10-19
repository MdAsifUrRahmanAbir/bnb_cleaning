import '../../backend/model/common/common_success_model.dart';
import '../../backend/services/dashboard_service.dart';
import '../../backend/static_data.dart';
import '../../utils/basic_screen_imports.dart';
import 'properties_controller.dart';

class UpdatePropertiesController extends GetxController with DashboardService{

  final propertyNameController = TextEditingController();
  final propertyDescriptionController = TextEditingController();

  final contactNameController = TextEditingController();
  final contactPhoneController = TextEditingController();

  final addressController = TextEditingController();
  final postCodeController = TextEditingController();

  Rx<DropDownUseModel> selectedPropertyType = propertyType.first.obs;
  Rx<DropDownUseModel> selectedPropertyAccess = propertyAccess.first.obs;

  String propertyId = "";

  @override
  void dispose() {
    propertyNameController.dispose();
    propertyDescriptionController.dispose();
    contactNameController.dispose();
    contactPhoneController.dispose();
    addressController.dispose();
    postCodeController.dispose();
    super.dispose();
  }

  // @override
  // void onInit() {
  //   // TODO: set initial values
  //   super.onInit();
  // }

  void updateProperty() {
    myPropertyUpdateProcess(propertyId); // need to pass id
  }


  /// ------------------------------------- >>
  final _isUpdateLoading = false.obs;
  bool get isUpdateLoading => _isUpdateLoading.value;

  late CommonSuccessModel _myPropertyUpdateModel;
  CommonSuccessModel get myPropertyUpdateModel => _myPropertyUpdateModel;

  ///* MyPropertySave in process
  Future<CommonSuccessModel> myPropertyUpdateProcess(String id) async {
    _isUpdateLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      "identifier": propertyNameController.text,
      "property_type": selectedPropertyType.value.title,
      "description": propertyDescriptionController.text,
      "new_contact_name": contactNameController.text,
      "new_contact_number": contactPhoneController.text,
      "access": selectedPropertyAccess.value.title,
      "address": addressController.text,
      "postcode": postCodeController.text
    };

    await myPropertyUpdateProcessApi(body: inputBody, id: id).then((value) {
      _myPropertyUpdateModel = value!;
      Get.close(1);
      Get.find<PropertiesController>().myPropertyProcess();
      _isUpdateLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isUpdateLoading.value = false;
    update();
    return _myPropertyUpdateModel;
  }
}
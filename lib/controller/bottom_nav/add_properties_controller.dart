import '../../backend/model/my_property/my_property_save_model.dart';
import '../../backend/services/dashboard_service.dart';
import '../../backend/static_data.dart';
import '../../utils/basic_screen_imports.dart';
import 'properties_controller.dart';

class AddPropertiesController extends GetxController with DashboardService{

  final propertyNameController = TextEditingController();
  final propertyDescriptionController = TextEditingController();

  final contactNameController = TextEditingController();
  final contactPhoneController = TextEditingController();

  final addressController = TextEditingController();
  final postCodeController = TextEditingController();

  Rx<DropDownUseModel> selectedPropertyType = propertyType.first.obs;
  Rx<DropDownUseModel> selectedPropertyAccess = propertyAccess.first.obs;

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

  void createProperty() {
    myPropertySaveProcess();
  }

  /// ------------------------------------- >>
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late MyPropertySaveModel _myPropertySaveModel;
  MyPropertySaveModel get myPropertySaveModel => _myPropertySaveModel;

  ///* MyPropertySave in process
  Future<MyPropertySaveModel> myPropertySaveProcess() async {
    _isLoading.value = true;
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

    await myPropertySaveProcessApi(body: inputBody).then((value) {
      _myPropertySaveModel = value!;
      Get.find<PropertiesController>().myPropertyProcess();
      Get.close(1);
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _myPropertySaveModel;
  }


}
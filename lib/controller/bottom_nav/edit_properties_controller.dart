import '../../backend/static_data.dart';
import '../../utils/basic_screen_imports.dart';

class UpdatePropertiesController extends GetxController{

  final propertyNameController = TextEditingController();
  final propertyDescriptionController = TextEditingController();

  final contactNameController = TextEditingController();
  final contactPhoneController = TextEditingController();

  final addressController = TextEditingController();
  final postCodePhoneController = TextEditingController();

  Rx<DropDownUseModel> selectedPropertyType = propertyType.first.obs;
  Rx<DropDownUseModel> selectedPropertyAccess = propertyAccess.first.obs;

  @override
  void dispose() {
    propertyNameController.dispose();
    propertyDescriptionController.dispose();
    contactNameController.dispose();
    contactPhoneController.dispose();
    addressController.dispose();
    postCodePhoneController.dispose();
    super.dispose();
  }

  void updateProperty() {
    
  }
}
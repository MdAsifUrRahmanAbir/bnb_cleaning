
import 'package:get/get.dart';

import '../../backend/model/my_property/property_list_model.dart';
import '../../backend/services/dashboard_service.dart';
import '../../routes/routes.dart';

class PropertiesController extends GetxController with DashboardService{

  @override
  void onInit() {
    myPropertyProcess();
    super.onInit();
  }

  void addPropertiesRoute() {
    Get.toNamed(Routes.addPropertiesScreen);
  }

  /// ------------------------------------- >>
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late MyPropertyModel _myPropertyModel;
  MyPropertyModel get myPropertyModel => _myPropertyModel;

  ///* Get MyProperty in process
  Future<MyPropertyModel> myPropertyProcess() async {
    _isLoading.value = true;
    update();
    await myPropertyProcessApi().then((value) {
      _myPropertyModel = value!;
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _myPropertyModel;
  }


}
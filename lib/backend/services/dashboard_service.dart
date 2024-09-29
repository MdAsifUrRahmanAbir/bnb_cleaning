import '../model/common/common_success_model.dart';
import '../model/my_property/my_property_save_model.dart';
import '../model/my_property/property_list_model.dart';
import '../model/price_list/price_list_model.dart';
import '../utils/api_method.dart';
import '../utils/custom_snackbar.dart';
import '../utils/logger.dart';
import 'api_endpoint.dart';

final log = logger(DashboardService);

mixin DashboardService{
  ///* Get PriceList api services
  Future<PriceListModel?> priceListProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.priceListURL,
      );
      if (mapResponse != null) {
        PriceListModel result = PriceListModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from PriceList api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Get MyProperty api services
  Future<MyPropertyModel?> myPropertyProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.myPropertyURL,
        showResult: true
      );
      if (mapResponse != null) {
        MyPropertyModel result = MyPropertyModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from MyProperty api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* MyPropertySave api services
  Future<MyPropertySaveModel?> myPropertySaveProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.myPropertySaveURL,
        body,
      );
      if (mapResponse != null) {
        MyPropertySaveModel result = MyPropertySaveModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from MyPropertySave api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* CartSave api services
  Future<CommonSuccessModel?> myPropertyUpdateProcessApi(
      {required Map<String, dynamic> body, required String id}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).put(
        "${ApiEndpoint.myPropertyUpdateURL}/$id",
        body,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(result.message.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from CartSave api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }


  ///* CartSave api services
  Future<CommonSuccessModel?> cartSaveProcessApi(
      {required Map<String, dynamic> body, required String id}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        "${ApiEndpoint.shoppingCartURL}/$id",
        body,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(result.message.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from CartSave api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

}
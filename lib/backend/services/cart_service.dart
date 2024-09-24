import '../model/cart/service_success_model.dart';
import '../model/my_property/cart_index_model.dart';
import '../utils/api_method.dart';
import '../utils/custom_snackbar.dart';
import '../utils/logger.dart';
import 'api_endpoint.dart';

final log = logger(CartService);

mixin CartService{

  ///* Get CartIndex api services
  Future<CartIndexModel?> cartIndexProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.shoppingCartURL,
      );
      if (mapResponse != null) {
        CartIndexModel result = CartIndexModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from CartIndex api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }


  ///* AirbnbUpdate api services
  Future<ServiceSuccessModel?> airbnbUpdateProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.updateAirbnbServiceURL,
        body,
      );
      if (mapResponse != null) {
        ServiceSuccessModel result = ServiceSuccessModel.fromJson(mapResponse);
        // CustomSnackBar.success("");
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from AirbnbUpdate api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }


  ///* LineUpdate api services
  Future<ServiceSuccessModel?> lineUpdateProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.updateLineServiceURL,
        body,
      );
      if (mapResponse != null) {
        ServiceSuccessModel result = ServiceSuccessModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from LineUpdate api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }


  ///* MidStayUpdate api services
  Future<ServiceSuccessModel?> midStayUpdateProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.updateMidStayServiceURL,
        body,
      );
      if (mapResponse != null) {
        ServiceSuccessModel result = ServiceSuccessModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from MidStayUpdate api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }


  ///* ProductAndBundleUpdate api services
  Future<ServiceSuccessModel?> productAndBundleUpdateProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.updateProAndBundleServiceURL,
        body,
      );
      if (mapResponse != null) {
        ServiceSuccessModel result = ServiceSuccessModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from ProductAndBundleUpdate api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }


  ///* OthersUpdate api services
  Future<ServiceSuccessModel?> othersUpdateProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.updateOtherServiceURL,
        body,
      );
      if (mapResponse != null) {
        ServiceSuccessModel result = ServiceSuccessModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from OthersUpdate api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

}
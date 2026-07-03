import 'package:bnb_clean/backend/model/common/common_success_model.dart';

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

  ///* Delete Cart api services
  Future<CommonSuccessModel?> cartDeleteProcessApi(String id) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).delete(
        "${ApiEndpoint.cartDeleteURL}/$id",
        code: 200
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(result.message.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from CartIndex api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }



  ///* Delete Cart api services
  Future<CommonSuccessModel?> cartDateUpdateProcessApi(String id, {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).put(
        "${ApiEndpoint.cartDateUpdateURL}/$id/update-date",
          body,
        showResult: true,
        code: 200
      );
      print(mapResponse);
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success("Date selected successfully!");
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
      {required String orderId, required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        "${ApiEndpoint.updateAirbnbServiceURL}/$orderId",
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
      {required String orderId, required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        "${ApiEndpoint.updateLineServiceURL}/$orderId",
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
      {required String orderId, required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        "${ApiEndpoint.updateMidStayServiceURL}/$orderId",
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
      {required String orderId, required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        "${ApiEndpoint.updateProAndBundleServiceURL}/$orderId",
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
      {required String orderId, required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        "${ApiEndpoint.updateOtherServiceURL}/$orderId",
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


  ///* OrderProcess api services
  Future<CommonSuccessModel?> orderProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.orderProcessURL,
        body,
        showResult: true
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        if(result.success){
          CustomSnackBar.success(result.message.toString());
        }else{
          CustomSnackBar.error(result.message.toString());
        }

        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from OthersUpdate api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }



  ///* repeatOrder api services
  Future<CommonSuccessModel?> repeatOrderApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.reorderPlaceURL,
        body,
        showResult: true
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        if(result.success){
          CustomSnackBar.success(result.message.toString());
        }else{
          CustomSnackBar.error(result.message.toString());
        }

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
import 'package:bnb_clean/backend/model/common/common_success_model.dart';

import '../model/auth/login_model.dart';
import '../model/auth/register_model.dart';
import '../utils/api_method.dart';
import '../utils/custom_snackbar.dart';
import '../utils/logger.dart';
import 'api_endpoint.dart';

final log = logger(AuthService);

mixin AuthService{
  ///* Login api services
  Future<LoginModel?> loginProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.loginURL,
        body,
      );
      if (mapResponse != null) {
        LoginModel result = LoginModel.fromJson(mapResponse);
        CustomSnackBar.success("Login Successfully.");
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from Login api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Registration api services
  Future<RegistrationModel?> registrationProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.registerURL,
        body,
        code: 201
      );
      if (mapResponse != null) {
        RegistrationModel result = RegistrationModel.fromJson(mapResponse);
        CustomSnackBar.success("Registration successfully done. Wait for Admin Approval");
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from Registration api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('The email has already been taken.');
      return null;
    }
    return null;
  }


  ///* ForgotPassword api services
  Future<CommonSuccessModel?> forgotPasswordProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.forgotPasswordURL,
        body,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(result.message.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from ForgotPassword api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }


  ///* ResetPassword api services
  Future<CommonSuccessModel?> resetPasswordProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.resetPasswordURL,
        body,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(result.message.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from ResetPassword api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
}
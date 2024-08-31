import '../model/auth/login_model.dart';
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
}
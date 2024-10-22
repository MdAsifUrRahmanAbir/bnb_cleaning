//
//
// import 'package:bnb_clean/backend/model/common/common_success_model.dart';
// import 'package:bnb_clean/utils/basic_screen_imports.dart';
//
// import '../../backend/services/auth_service.dart';
// import 'login_controller.dart';
//
// class ResetPasswordController extends GetxController with AuthService{
//   final newPassword = TextEditingController();
//   final confirmPassword = TextEditingController();
//   // final formKey = GlobalKey<FormState>();
//
//   @override
//   void dispose() {
//     newPassword.dispose();
//     confirmPassword.dispose();
//     super.dispose();
//   }
//
//   void changePassword() async{
//     if(formKey.currentState!.validate()){
//       await resetPasswordProcess();
//     }
//   }
//
//
//   /// ------------------------------------- >>
//   final _isLoading = false.obs;
//   bool get isLoading => _isLoading.value;
//
//
//   late CommonSuccessModel _resetPasswordModel;
//   CommonSuccessModel get resetPasswordModel => _resetPasswordModel;
//
//
//   ///* ResetPassword in process
//   Future<CommonSuccessModel> resetPasswordProcess() async {
//     _isLoading.value = true;
//     update();
//     Map<String, dynamic> inputBody = {
//       "token": Get.find<LoginController>().resetEmailController.text,   /// todo
//       "email": Get.find<LoginController>().resetEmailController.text,
//       "password": newPassword.text,
//       "password_confirmation": confirmPassword.text
//     };
//     await resetPasswordProcessApi(body: inputBody).then((value) {
//       _resetPasswordModel = value!;
//       _isLoading.value = false;
//       update();
//     }).catchError((onError) {
//       log.e(onError);
//     });
//     _isLoading.value = false;
//     update();
//     return _resetPasswordModel;
//   }
// }
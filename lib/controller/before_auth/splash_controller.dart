import 'dart:async';

import '../../../routes/routes.dart';
import '../../backend/local_storage/local_storage.dart';
import '../../utils/basic_screen_imports.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    _goToScreen();
  }

  _goToScreen() async {
    debugPrint(LocalStorage.isLoggedIn().toString());
    Timer(const Duration(seconds: 2), () {
      LocalStorage.isLoggedIn()
          ? Get.offAllNamed(Routes.btmScreen)
          : Get.offAllNamed(Routes.loginScreen);
    });
  }
}

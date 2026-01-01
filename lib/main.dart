import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'routes/pages.dart';
import 'routes/routes.dart';
import 'utils/strings.dart';
import 'utils/theme.dart';

void main() async{


  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  // Stripe.publishableKey = "pk_test_51MKjbqCzST7grXFxFSBYoBOCTUnF22C4X1SCPWWrNUA2USehkTkimN9aVQoxNjmDwYeDazNodFBovOKTPFQtpzYh00HnHdi6El";
  Stripe.publishableKey = "pk_test_51HTXM9LlJ7MCoKylcyIDBrswA5HHnaZe6MsYi82GIthVYKKK5pIc4ZVT9JOtvgwy5XVcJpdaq7BnYcl1LF9XqcS500kwqFD5tC";
  await Stripe.instance.applySettings();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: Themes().theme,
      initialRoute: Routes.splashScreen,
      initialBinding: BindingsBuilder(
            () {
          /// if need
        },
      ),
      getPages: Pages.list,
      navigatorKey: Get.key,
      builder: (context, widget) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: widget!,
            ));
      },
    );
  }
}
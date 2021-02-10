import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constant/constant.dart';
import 'routes/app_pages.dart';
import 'splash_screen.dart';
import 'theme/style.dart';

/// [App]
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: K.appName,
      // initialRoute: AppPages.INITIAL,
      home: SplashScreen(),
      theme: Style.themeData,
      getPages: AppPages.routes,
    );
  }
}

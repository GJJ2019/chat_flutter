import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constant/image_constant.dart';
import 'core/db/db.dart';
import 'routes/app_pages.dart';
import 'theme/style.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    navigate();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: Image.asset(ImageK.logoRound)),
            LinearProgressIndicator(
              backgroundColor: Style.accentColor.withOpacity(0.5),
              minHeight: 5,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> navigate() async {
    // for splash screen animation
    await Future.delayed(const Duration(seconds: 2));
    final isLogin = DB.box.get(DB.isLogin) ?? false;
    if (isLogin)
      await Get.offAllNamed(Routes.CHAT);
    else
      await Get.offAllNamed(Routes.AUTH);
  }
}

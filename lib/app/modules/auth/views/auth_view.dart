import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';

import '../../../core/constant/image_constant.dart';
import '../../../theme/style.dart';
import '../../../widget/button.dart';
import '../../../widget/custom_text_field.dart';
import '../controllers/auth_controller.dart';
import 'register_view.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            Image.asset(ImageK.logoRound, height: 100),
            const SizedBox(height: 40),
            CustomTextField(
              title: 'Email',
              textEditingController: controller.emailT,
              icon: FluentIcons.mail_24_regular,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            Obx(
              () => CustomTextField(
                title: 'Password',
                textEditingController: controller.passwordT,
                icon: FluentIcons.lock_closed_24_regular,
                obscureText: !controller.showPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.showPassword ? FluentIcons.eye_show_24_regular : FluentIcons.eye_hide_24_regular,
                  ),
                  onPressed: controller.toggleShowPassword,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Obx(
              () => Button(
                onPressed: controller.loginViaEmail,
                title: 'Login',
                isLoading: controller.loading,
              ),
            ),
            const SizedBox(height: 10),
            const Text('OR', style: boldMedium, textAlign: TextAlign.center),
            const SizedBox(height: 10),
            SignInButton(
              Buttons.FacebookNew,
              onPressed: controller.loginViaFacebook,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () => Get.offAll(RegisterView()),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: medium.copyWith(color: Style.blackColor),
                  children: <TextSpan>[
                    const TextSpan(text: 'Don\'t have an Account?  '),
                    const TextSpan(text: 'Sign Up', style: boldMedium),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

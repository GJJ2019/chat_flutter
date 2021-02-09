import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

import '../../../core/constant/image_constant.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/style.dart';
import '../../../widget/button.dart';
import '../../../widget/custom_text_field.dart';
import '../controllers/auth_controller.dart';

class RegisterView extends StatelessWidget {
  final controller = Get.find<AuthController>();
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
            const SizedBox(height: 20),
            CustomTextField(
              title: 'Confirm Password',
              textEditingController: controller.confirmPasswordT,
              icon: FluentIcons.lock_closed_24_regular,
              obscureText: true,
            ),
            const SizedBox(height: 40),
            Obx(
              () => Button(
                onPressed: controller.registerViaEmail,
                title: 'Register',
                isLoading: controller.loading,
              ),
            ),
            const SizedBox(height: 10),
            const Text('OR', style: boldMedium, textAlign: TextAlign.center),
            const SizedBox(height: 10),
            SignInButton(
              Buttons.FacebookNew,
              onPressed: controller.loading ? null : controller.loginViaFacebook,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
              text: 'Sign Up with Facebook',
            ),
            const SizedBox(height: 30),
            Obx(
              () => GestureDetector(
                onTap: controller.loading ? null : () => Get.offAllNamed(Routes.AUTH),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: medium.copyWith(color: Style.blackColor),
                    children: <TextSpan>[
                      const TextSpan(text: 'Have an Account?  '),
                      const TextSpan(text: 'Sign In', style: boldMedium),
                    ],
                  ),
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

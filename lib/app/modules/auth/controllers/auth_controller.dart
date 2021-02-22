import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/helper/user.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/side_effect.dart';
import '../data/auth_repository.dart';
import '../data/i_auth_repository.dart';

class AuthController extends GetxController {
  AuthController(this._authRepository);

  final IAuthRepository _authRepository;

  TextEditingController emailT, passwordT, confirmPasswordT;

  @override
  void onInit() {
    emailT = TextEditingController();
    passwordT = TextEditingController();
    confirmPasswordT = TextEditingController();

    Get.find<FirebaseAuth>().authStateChanges().listen((user) async {
      print('user is $user');
      if (user != null) {
        UserData.saveLocalData(user);
        await Get.offAllNamed(Routes.CHAT);
      }
    });

    super.onInit();
  }

  /// for login via email and password
  void loginViaEmail() async {
    final email = emailT.text;
    final password = passwordT.text;

    if (email.isEmpty && password.isEmpty) {
      SideEffects.showSnackBar('Please enter valid data');
    } else {
      _changeLoading(true);
      try {
        await _authRepository.loginViaEmailPassword(email: email, password: password);
      } on ErrorUtils catch (e) {
        SideEffects.showSnackBar(e.errorMessage);
      } finally {
        _changeLoading(false);
      }
    }
  }

  /// for login via facebook
  Future<void> loginViaFacebook() async {
    _changeLoading(true);
    try {
      await _authRepository.loginViaFacebook();
    } on ErrorUtils catch (e) {
      SideEffects.showSnackBar(e.errorMessage);
    } finally {
      _changeLoading(false);
    }
  }

  /// for register via email and password
  Future<void> registerViaEmail() async {
    final email = emailT.text;
    final password = passwordT.text;
    final confirmPassword = confirmPasswordT.text;

    if (email.isEmpty && password.isEmpty) {
      SideEffects.showSnackBar('Please enter valid data');
    } else if (password != confirmPassword) {
      SideEffects.showSnackBar('Password don\'t match');
    } else {
      _changeLoading(true);
      try {
        final success = await _authRepository.registerViaEmailPassword(email: email, password: password);
        if (success) await Get.offAllNamed(Routes.CHAT);
      } on ErrorUtils catch (e) {
        SideEffects.showSnackBar(e.errorMessage);
      } finally {
        _changeLoading(false);
      }
    }
  }

  /// for getting loading value
  bool get showPassword => _showPassword.value;
  final _showPassword = false.obs;
  void toggleShowPassword() {
    _showPassword.value = !_showPassword.value;
  }

  /// for getting loading value
  bool get loading => _loading.value;
  final _loading = false.obs;
  void _changeLoading(bool val) {
    _loading.value = val;
  }

  // void _clearTextField() {
  //   emailT.clear();
  //   passwordT.clear();
  //   confirmPasswordT.clear();
  // }
}

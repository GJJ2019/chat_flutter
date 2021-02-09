import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../data/auth_repository.dart';
import '../data/i_auth_repository.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() {
      Get..put<FirebaseAuth>(FirebaseAuth.instance)..put<IAuthRepository>(AuthRepository(Get.find()));
      return AuthController(Get.find());
    });
  }
}

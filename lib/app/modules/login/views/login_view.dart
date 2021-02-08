import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () async {
            final result = await FacebookAuth.instance.login();

            print(result);

            // Create a credential from the access token
            // final FacebookAuthCredential facebookAuthCredential =
            //     FacebookAuthProvider.credential(result.accessToken.token);
          },
          child: Text(
            'LoginView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

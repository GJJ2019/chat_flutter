import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/db/db.dart';
import '../../../splash_screen.dart';
import '../../../widget/side_effect.dart';
import '../../auth/data/auth_repository.dart';
import '../data/i_main_repository.dart';
import '../data/model/github_user_model.dart';

class MainController extends GetxController {
  MainController(this._iMainRepository);

  final IMainRepository _iMainRepository;

  ScrollController scrollController;

  @override
  void onInit() {
    _getData();
    super.onInit();
  }

  final githubUsers = <GithubUserModel>[].obs;

  final selectedGithubUser = <GithubUserModel>[].obs;

  void _getData() async {
    _loading.value = true;
    try {
      final data = await _iMainRepository.get();
      githubUsers.addAll(data);
    } on ErrorUtils catch (e) {
      SideEffects.showSnackBar(e.errorMessage);
    }
    _loading.value = false;
  }

  void onTap(bool val, GithubUserModel githubUserModel) {
    if (val) {
      selectedGithubUser.add(githubUserModel);
    } else {
      selectedGithubUser.remove(githubUserModel);
    }
  }

  bool get loading => _loading.value;
  final _loading = true.obs;

  void logout() async {
    await DB.box.clear();
    await FirebaseAuth.instance.signOut();
    await Get.offAll(SplashScreen());
  }
}

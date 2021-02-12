import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';
import '../widget/github_user_card.dart';

class SelectedUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainController>();

    return Obx(() => controller.loading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: controller.selectedGithubUser.length,
            itemBuilder: (context, index) {
              final user = controller.selectedGithubUser[index];
              return GithubUserCard(githubUserModel: user);
            },
          ));
  }
}

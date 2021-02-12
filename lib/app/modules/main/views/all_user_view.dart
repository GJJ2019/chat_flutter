import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';
import '../widget/github_user_card.dart';

class AllUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainController>();

    return Obx(() => controller.loading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: controller.githubUsers.length,
            itemBuilder: (context, index) {
              return GithubUserCard(githubUserModel: controller.githubUsers[index]);
            },
          ));
  }
}

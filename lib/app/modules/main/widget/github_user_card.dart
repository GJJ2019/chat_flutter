import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/custom_container.dart';
import '../controllers/main_controller.dart';
import '../data/model/github_user_model.dart';

class GithubUserCard extends StatelessWidget {
  const GithubUserCard({Key key, @required this.githubUserModel}) : super(key: key);

  ///
  final GithubUserModel githubUserModel;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainController>();

    return CustomContainer(
      width: Get.width,
      height: Get.height * 0.1,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(githubUserModel.avatarUrl)),
        title: Text(githubUserModel.login.toString()),
        trailing: Obx(
          () => Checkbox(
            value: controller.selectedGithubUser.contains(githubUserModel),
            onChanged: (val) => controller.onTap(val, githubUserModel),
          ),
        ),
      ),
    );
  }
}

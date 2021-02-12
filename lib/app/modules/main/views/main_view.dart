import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/style.dart';
import '../controllers/main_controller.dart';
import 'all_user_view.dart';
import 'selected_user_view.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Github User'),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Style.whiteColor,
            tabs: [
              Tab(child: Text('All User', style: medium)),
              Tab(child: Text('Selected User', style: medium)),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(FluentIcons.sign_out_24_regular),
              onPressed: controller.logout,
              color: Style.whiteColor,
            ),
          ],
        ),
        body: TabBarView(
          children: [AllUserView(), SelectedUserView()],
        ),
      ),
    );
  }
}

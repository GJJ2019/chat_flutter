import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/style.dart';
import '../controllers/chat_controller.dart';
import '../widget/bubble.dart';

///
class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Sign Out', style: boldMedium),
                IconButton(
                  icon: const Icon(FluentIcons.sign_out_24_filled),
                  onPressed: controller.logout,
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => controller.chats.isEmpty
                  ? const Center(
                      child: Text('Start Chatting Now', style: boldLarge),
                    )
                  : ListView.builder(
                      itemCount: controller.chats.length,
                      itemBuilder: (context, index) => Bubble(
                        text: controller.chats[index].chatMessage,
                        color: Style.greenColor,
                        isSender: controller.chats[index].isUserMessage,
                        email: controller.chats[index].userEmail,
                        photoUrl: controller.chats[index].photoUrl,
                      ),
                    ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 5),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Style.whiteColor,
              boxShadow: [const BoxShadow(color: Style.shadowColor, blurRadius: 10)],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.messageT,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Your Message',
                    ),
                    style: semiBoldMedium,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => controller.sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(FluentIcons.send_24_regular),
                  onPressed: controller.sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

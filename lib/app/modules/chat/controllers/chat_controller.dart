import 'package:chat_flutter/app/core/db/db.dart';
import 'package:chat_flutter/app/modules/chat/data/model/chat_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/i_chat_repository.dart';

class ChatController extends GetxController {
  ChatController(this._iChatRepository);

  final IChatRepository _iChatRepository;

  TextEditingController messageT;

  @override
  void onInit() {
    messageT = TextEditingController();
    _chats.bindStream(_iChatRepository.getChats());
    super.onInit();
  }

  final _chats = <ChatModel>[].obs;
  RxList<ChatModel> get chats => _chats;

  void sendMessage() {
    if (messageT.text.isNotEmpty) {
      _iChatRepository.addChat(data: {
        'userEmail': DB.box.get(DB.email),
        'photoUrl': DB.box.get(DB.photoUrl),
        'chatMessage': messageT.text,
        'date': DateTime.now().millisecondsSinceEpoch,
      });
      messageT.clear();
    }
  }
}

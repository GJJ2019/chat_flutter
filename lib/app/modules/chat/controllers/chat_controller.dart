import 'package:chat_flutter/app/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/db/db.dart';
import '../data/i_chat_repository.dart';
import '../data/model/chat_model.dart';

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

  Future<void> logout() async {
    await DB.box.clear();
    await FirebaseAuth.instance.signOut();
    await Get.offAll(SplashScreen());
  }
}

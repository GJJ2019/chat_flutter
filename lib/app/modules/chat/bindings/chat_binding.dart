import 'package:get/get.dart';

import '../controllers/chat_controller.dart';
import '../data/chat_repository.dart';
import '../data/i_chat_repository.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() {
      Get.put<IChatRepository>(ChatRepository(Get.find()));
      return ChatController(Get.find());
    });
  }
}

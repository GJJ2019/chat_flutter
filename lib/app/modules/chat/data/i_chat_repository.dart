import 'package:meta/meta.dart';

import 'model/chat_model.dart';

abstract class IChatRepository {
  /// for getting chats
  Stream<List<ChatModel>> getChats();

  /// for adding chats by user
  void addChat({@required Map<String, dynamic> data});
}

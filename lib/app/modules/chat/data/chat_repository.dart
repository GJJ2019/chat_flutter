import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import 'i_chat_repository.dart';
import 'model/chat_model.dart';

class ChatRepository extends IChatRepository {
  ///
  ChatRepository(this._firestore);

  /// [FirebaseFirestore]
  final FirebaseFirestore _firestore;

  final _collectionPath = 'chat';

  @override
  void addChat({@required Map<String, dynamic> data}) async {
    await _firestore.collection(_collectionPath).add(data);
  }

  @override
  Stream<List<ChatModel>> getChats() {
    return _firestore
        .collection(_collectionPath)
        .orderBy('date')
        .snapshots()
        .map((event) => event.docs.map((e) => ChatModel.from(e)).toList());
  }
}

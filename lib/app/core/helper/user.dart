import 'package:firebase_auth/firebase_auth.dart' show User;

import '../db/db.dart';

class UserData {
  static void saveLocalData(User user) {
    DB.box..put(DB.isLogin, true)..put(DB.email, user.email)..put(DB.photoUrl, user.photoURL)..put(DB.uuid, user.uid);
  }
}

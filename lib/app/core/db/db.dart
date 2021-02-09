import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constant/constant.dart';

/// main database class for hive
class DB {
  /// return bool value if enable or not
  static const String isLogin = 'isLogin';

  /// return email of the user
  static const String email = 'email';

  /// return photo url of the user
  static const String photoUrl = 'photoUrl';

  /// return uuid of particular user
  static const String uuid = 'uuid';

  /// main hive [Box] box
  static Box box;

  /// initialise database
  static Future<void> init() async {
    // initialise database
    await Hive.initFlutter();

    // open hive box
    DB.box = await Hive.openBox(K.appName);
  }
}

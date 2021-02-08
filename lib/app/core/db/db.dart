import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constant/constant.dart';

/// main database class for hive
class DB {
  /// return bool value if enable or not
  static const String webPageCache = 'Web Page Cache';

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

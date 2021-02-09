import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import '../db/db.dart';

/// Dependency Injection class
///
class DI {
  ///
  /// [init] method for DI
  ///
  static Future<void> init() async {
    await Firebase.initializeApp();
    Get..lazyPut<FirebaseFirestore>(() => FirebaseFirestore.instance, fenix: true);
    // initialise instance here
    await DB.init();
  }
}

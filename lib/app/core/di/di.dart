import 'dart:io' show ContentType;

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../db/db.dart';

/// Dependency Injection class
///
class DI {
  ///
  /// [init] method for DI
  ///
  static Future<void> init() async {
    await Firebase.initializeApp();
    Get
      ..lazyPut<Dio>(() {
        return Dio(
          BaseOptions(
            connectTimeout: 30000,
            baseUrl: K.baseUrl,
            contentType: ContentType.json.toString(),
          ),
        );
      }, fenix: true);
    // initialise instance here
    await DB.init();
  }
}

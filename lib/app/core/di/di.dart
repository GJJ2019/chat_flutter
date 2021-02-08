import '../db/db.dart';

/// Dependency Injection class
///
class DI {
  ///
  /// [init] method for DI
  ///
  static Future<void> init() async {
    // initialise instance here
    await DB.init();
  }
}

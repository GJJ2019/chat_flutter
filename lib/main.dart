import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome, SystemUiOverlayStyle;

import 'app/app.dart';
import 'app/core/di/di.dart';
import 'app/theme/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Forcing only portrait orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // for setting status bar color to [Style.accentColor]
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Style.accentColor));

  await DI.init();
  runApp(App());
}

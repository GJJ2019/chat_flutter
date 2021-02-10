import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
  ];
}

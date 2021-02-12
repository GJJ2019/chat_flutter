import 'package:get/get.dart';

import '../controllers/main_controller.dart';
import '../data/i_main_repository.dart';
import '../data/main_repository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () {
        Get.put<IMainRepository>(MainRepository());
        return MainController(Get.find());
      },
    );
  }
}

import 'package:get/get.dart';

import '../controllers/launch_page_controller.dart';

class LaunchPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LaunchPageController>(
      LaunchPageController(),
    );
  }
}

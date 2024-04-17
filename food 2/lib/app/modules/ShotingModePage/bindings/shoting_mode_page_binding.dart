import 'package:get/get.dart';

import '../controllers/shoting_mode_page_controller.dart';

class ShotingModePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ShotingModePageController>(
      ShotingModePageController(),
    );
  }
}

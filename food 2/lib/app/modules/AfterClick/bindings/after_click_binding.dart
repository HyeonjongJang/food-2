import 'package:get/get.dart';

import '../controllers/after_click_controller.dart';

class AfterClickBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AfterClickController>(
      AfterClickController(),
    );
  }
}

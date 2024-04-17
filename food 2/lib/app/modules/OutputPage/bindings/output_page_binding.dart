import 'package:get/get.dart';

import '../controllers/output_page_controller.dart';

class OutputPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OutputPageController>(
      OutputPageController(),
    );
  }
}

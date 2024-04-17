import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LaunchPageController extends GetxController {
  // final count = 0.obs;
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamedUntil(Routes.SHOTING_MODE_PAGE, (route) => false);
    });
    super.onInit();
  }

  // void increment() => count.value++;
}

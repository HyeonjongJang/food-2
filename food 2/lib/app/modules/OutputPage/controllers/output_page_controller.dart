import 'package:camera/camera.dart';
import 'package:get/get.dart';

class OutputPageController extends GetxController {
  late final XFile file;
  @override
  void onInit() {
    file = Get.arguments['image'];
    super.onInit();
  }
}

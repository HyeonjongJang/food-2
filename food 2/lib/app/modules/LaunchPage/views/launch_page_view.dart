import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../custom_button.dart';
import '../controllers/launch_page_controller.dart';

class LaunchPageView extends GetView<LaunchPageController> {
  const LaunchPageView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put<LaunchPageController>(
      LaunchPageController(),
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(),
          const CircularProgressIndicator(),
          // CircleAvatar(
          //   radius: 50,
          //   backgroundColor: themeColor.shade50,
          // ),
          const Text(
            "앱이 실행중입니다...",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: themeColor.shade100,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("LOGO")
            ],
          ),
        ],
      ),
    );
  }
}

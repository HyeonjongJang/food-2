import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food/custom_button.dart';

import 'package:get/get.dart';

import '../controllers/output_page_controller.dart';

class OutputPageView extends GetView<OutputPageController> {
  const OutputPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '식사요약',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Get.width * 0.8,
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(30)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.file(
                      File(
                        controller.file.path,
                      ),
                      fit: BoxFit.fill,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: Get.width * 0.4,
                width: Get.width * 0.9,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: themeColor.shade200)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Some Text"),
                      Container(
                        height: 40,
                        width: Get.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.cyan.shade50,
                            border: Border.all(color: Colors.black12)),
                        child: const Center(child: Text("Some text")),
                      ),
                      Container(
                        height: 40,
                        width: Get.width * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.pink.shade50,
                            border: Border.all(color: Colors.black12)),
                        child: const Center(child: Text("Some text")),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: Get.width * 0.4,
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.cyan.shade50,
                    border: Border.all(color: themeColor.shade200)),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: Get.width * 0.4,
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: themeColor.shade200)),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

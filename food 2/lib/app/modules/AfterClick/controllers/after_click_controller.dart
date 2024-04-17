// ignore_for_file: avoid_print

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../heh.dart';

enum PortionSize { small, medium, large }

class AfterClickController extends GetxController {
  final selectedPortionSize = PortionSize.medium.obs;
  final isCodeVisible = false.obs;

  final preData = {
    //
    "cocacola": {
      "amount": "500.00",
      "calorie": "216.00",
      "carbohydrate": "54.00",
      "protein": "0.00",
      "province": "0.00"
    },
    "strongman sausage": {
      "amount": "50.00",
      "calorie": "67.00",
      "carbohydrate": "7.00",
      "protein": "4.00",
      "province": "2.50"
    },
    "snickers": {
      "amount": "51.00",
      "calorie": "250.00",
      "carbohydrate": "30.00",
      "protein": "5.00",
      "province": "12.00"
    },
    "Pringles": {
      "amount": "110.00",
      "calorie": "566.50",
      "carbohydrate": "61.70",
      "protein": "5.60",
      "province": "27.30"
    },
    "seoul milk": {
      "amount": "500.00",
      "calorie": "340.00",
      "carbohydrate": "25.00",
      "protein": "15.00",
      "province": "20.00"
    },
    "spicy Jolbyeong": {
      "amount": "82.00.00",
      "calorie": "430.00",
      "carbohydrate": "49.00",
      "protein": "5.00",
      "province": "0.00"
    }
  };
  // bool isPreData = false;

  final selectedIndex = 0.obs;
  PageController pageController = PageController();

  late final XFile file;

  // late ResModel resMod;

  final isLoading = false.obs;

  // loadDataFromApi() async {
  //   isLoading.value = true;
  //   try {
  //     var res =
  //         await Dio().get("https://esuai.sugarmong.co.kr/app/download.php");

  //     var resNew = jsonDecode(res.data);
  //     print("RES NEW $resNew");
  //     // resMod = ResModel.fromJson(resNew);
  //     isLoading.value = false;

  //     // print(resMod.toJson());
  //   } catch (e) {
  //     print(e);
  //     isLoading.value = false;
  //   }

  //   // jsonDecode(res.data);
  //   // print();
  // }

  late ApiRes res;

  @override
  void onInit() {
    super.onInit();
    res = Get.arguments["data"];
    file = Get.arguments["img"];
    // if(res.)
    // print(res.packagedFood?.boundingBoxes?.remjs?.keys
    //     .toList()
    //     .contains("snickers"));

    // loadDataFromApi();
    // file = Get.arguments['image'];
  }

  // void increment() => count.value++;
}

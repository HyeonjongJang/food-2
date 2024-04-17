// ignore_for_file: avoid_print

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as ddio;
import 'package:food/heh.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

const String baseUrl =
// "http://3.38.243.237/docs";
// "http://35.216.12.152/docs"; //gc
    // "http://182.225.207.183:8000"
    // "http://182.225.207.183:80";
    // "http://125.134.138.114:80";
    "http://34.47.73.33:80/docs";

late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(
    GetMaterialApp(
      title: "UTINFRA FOOD LENS PC",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: MyCustomSplashScreen(),
    ),
  );
}

Future uploadImg(String imgPath, XFile file) async {
  try {
    await ddio.Dio()
        .post("$baseUrl/uploadfile/",
            data: ddio.FormData.fromMap({
              //image
              'file': await ddio.MultipartFile.fromFile(imgPath,
                  // filename: "img${DateTime.now().toIso8601String()}}"
                  filename: 'upload-${DateTime.now().toIso8601String()}.jpeg'
                  // filename: DateTime.timestamp().toIso8601String(),
                  )
            }))
        .then((valuee) async {
      if (valuee.statusCode == 200) {
        print(valuee.data);

        Get.toNamed(Routes.AFTER_CLICK,
            arguments: {'img': file, 'data': ApiRes.fromJson(valuee.data)});
      }
    });
  } catch (e) {
    Get.snackbar("Error", e.toString());
  }
}

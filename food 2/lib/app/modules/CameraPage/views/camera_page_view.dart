// ignore_for_file: avoid_print

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:food/custom_button.dart';
import 'package:food/main.dart';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../controllers/camera_page_controller.dart';

class CameraPageView extends GetView<CameraPageController> {
  const CameraPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CameraApp());
  }
}

class CameraApp extends StatefulWidget {
  /// Default Constructor
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          CameraPreview(controller),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: Get.width,
                height: Get.width,
                child: Icon(
                  CupertinoIcons.viewfinder,
                  size: Get.width,
                  color: Colors.white,
                ),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(Get.width),
                //   border: Border.all(color: Colors.red, width: 2),
                // ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: const RadialGradient(colors: [
                        Colors.white,
                        Colors.transparent,
                      ], stops: [
                        .8,
                        1
                      ]),
                      borderRadius: BorderRadius.circular(100)),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ClickableWidget(
                        onPressZoomPer: -40,
                        widget: const Icon(
                          CupertinoIcons.camera_circle_fill,
                          size: 110,
                        ),
                        onTap: () async {
                          // controller.pausePreview();

                          await controller.takePicture().then((value) {
                            Get.showOverlay(
                              asyncFunction: () async {
                                File temp = File(value.path);

                                var pickedImage = await decodeImageFromList(
                                    temp.readAsBytesSync());

                                print(
                                    "${pickedImage.width} ${pickedImage.height}");

                                if (pickedImage.height <= 700 &&
                                    pickedImage.width <= 700) {
                                  //a
                                  await uploadImg(value.path, value);
                                  //a
                                } else {
                                  print("hehe");

                                  var ddir =
                                      await getApplicationDocumentsDirectory();
                                  print(ddir.path);
                                  await FlutterImageCompress.compressAndGetFile(
                                    value.path, "${ddir.path}/img.jpeg",
                                    minHeight: 640,
                                    minWidth: 640,
                                    // quality: 88,
                                    // rotate: 180,
                                  ).then((compressedImg) async {
                                    await uploadImg(compressedImg!.path, value);
                                  });
                                }
                              },
                              loadingWidget: Scaffold(
                                appBar: AppBar(
                                  // title: const Text('ShotingModePageView'),
                                  // centerTitle: true,
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Image.asset(
                                        "assets/logon.png",
                                        height: 30,
                                      ),
                                    ),
                                  ],
                                  bottom: PreferredSize(
                                    preferredSize: const Size.fromHeight(1.0),
                                    child: Container(
                                      color: Colors.grey.shade300,
                                      height: 1.0,
                                    ),

                                    // surfaceTintColor: Colors.transparent,
                                  ),
                                ),
                                body: Container(
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Center(
                                          child: CupertinoActivityIndicator(
                                        radius: 50,
                                      )),
                                      SizedBox(
                                        height: Get.height * 0.05,
                                      ),
                                      const Text(
                                        "UPLOADING...",
                                        style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w800),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });

                          // Get.showOverlay(
                          //     asyncFunction: () async {
                          //       // var a;
                          //       // try {
                          //       //   await controller.takePicture().then((value) {
                          //       //     a = value;
                          //       //     // controller.pausePreview();
                          //       //   });
                          //       // } catch (e) {
                          //       //   print(e);
                          //       // }

                          //       // print(a);

                          //       // print("========= a $a ========");
                          //       await controller
                          //           .takePicture()
                          //           .then((value) async {
                          //         print(value);

                          //         // var formData = ddio.FormData.fromMap({
                          //         //   'file': await ddio.MultipartFile.fromFile(
                          //         //     value.path,

                          //         //     // filename: 'upload.jpeg'
                          //         //   )
                          //         // });

                          //         // await ddio.Dio()
                          //         //     .post(
                          //         //         "https://esuai.sugarmong.co.kr/app/upload.php",
                          //         //         data: formData)
                          //         //     .then((valuee) {
                          //         //   if (valuee.statusCode == 200) {
                          //         //     Get.toNamed(Routes.AFTER_CLICK,
                          //         //         arguments: {'image': value});
                          //         //   }
                          //         // });

                          //         try {
                          //           await ddio.Dio()
                          //               .post("http://3.38.243.237/uploadfile/",
                          //                   data: ddio.FormData.fromMap({
                          //                     //image
                          //                     'file': await ddio.MultipartFile
                          //                         .fromFile(
                          //                       value.path,
                          //                       // filename: 'upload.jpeg'
                          //                     )
                          //                   }))
                          //               .then((valuee) {
                          //             if (valuee.statusCode == 200) {
                          //               print(valuee.data);

                          //               Get.toNamed(Routes.AFTER_CLICK,
                          //                   arguments: {
                          //                     'image': value,
                          //                     'img': valuee
                          //                         .data["transformed_image"]
                          //                   });
                          //             }
                          //           });

                          //           // await ddio.Dio()
                          //           //     .post("http://3.38.243.237/uploadfile/",
                          //           //         data: formData)
                          //           //     .then((valuee) {
                          //           //   if (valuee.statusCode == 200) {
                          //           //     print(valuee.data);

                          //           //     Get.toNamed(Routes.AFTER_CLICK,
                          //           //         arguments: {
                          //           //           'image': value,
                          //           //           'img': valuee
                          //           //               .data["transformed_image"]
                          //           //         });
                          //           //   }
                          //           // });
                          //         } catch (e) {
                          //           Get.snackbar("Error", e.toString());
                          //         }

                          //         // Get.toNamed(Routes.AFTER_CLICK,
                          //         //     arguments: {'image': value});
                          //       });
                          //       // Future.delayed(Duration(seconds: 1), () {
                          //       //   Get.toNamed(
                          //       //     Routes.AFTER_CLICK,
                          //       //   );
                          //       // });
                          //       // }
                          //     },
                          //     loadingWidget: Scaffold(
                          //       appBar: AppBar(
                          //         // title: const Text('ShotingModePageView'),
                          //         // centerTitle: true,
                          //         actions: [
                          //           Padding(
                          //             padding: const EdgeInsets.symmetric(
                          //                 horizontal: 20.0),
                          //             child: Image.asset(
                          //               "assets/logon.png",
                          //               height: 30,
                          //             ),
                          //           ),
                          //         ],
                          //         bottom: PreferredSize(
                          //           preferredSize: const Size.fromHeight(1.0),
                          //           child: Container(
                          //             color: Colors.grey.shade300,
                          //             height: 1.0,
                          //           ),

                          //           // surfaceTintColor: Colors.transparent,
                          //         ),
                          //       ),
                          //       body: Container(
                          //         color: Colors.white,
                          //         child: Column(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             const Center(
                          //                 child: CupertinoActivityIndicator(
                          //               radius: 50,
                          //             )),
                          //             SizedBox(
                          //               height: Get.height * 0.05,
                          //             ),
                          //             const Text(
                          //               "LOADING",
                          //               style: TextStyle(
                          //                   color: Colors.amber,
                          //                   fontSize: 60,
                          //                   fontWeight: FontWeight.w800),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //     ));
                        }),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

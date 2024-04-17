// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:food/custom_button.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../main.dart';
import '../../../routes/app_pages.dart';
import '../controllers/shoting_mode_page_controller.dart';

class ShotingModePageView extends GetView<ShotingModePageController> {
  const ShotingModePageView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put<ShotingModePageController>(
      ShotingModePageController(),
    );
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   print(myDaata.values.first["calorie"]!.substring(
      //     7,
      //   ));
      //   print(myDaata.values.first["calorie"]!
      //       .substring(
      //         7,
      //       )
      //       .interpret());
      // }),
      appBar: AppBar(
        // title: const Text('ShotingModePageView'),
        // centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
      // floatingActionButton: FloatingActionButton(onPressed: () async {
      //   await ImagePicker()
      //       .pickImage(source: ImageSource.gallery)
      //       .then((value) async {
      //     controller.file.value = value;
      //   });
      // }),
      // extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClickableWidget(
                onPressZoomPer: -40,
                onTap: () {
                  Get.toNamed(Routes.CAMERA_PAGE);
                },
                widget: Transform.scale(
                  scale: 1.2,
                  child: Image.asset(
                    "assets/cam.png",
                  ),
                )),
            SizedBox(
              height: Get.height * 0.1,
            ),
            ClickableWidget(
              onPressZoomPer: -40,
              widget: Transform.scale(
                  scale: 1.2, child: Image.asset("assets/gal.png")),
              onTap: () async {
// Capture a photo.
                await ImagePicker().pickImage(source: ImageSource.gallery).then(
                  (value) async {
                    if (value == null) {
                      Get.snackbar("Error", "Please select an image");
                      return;
                    }

                    Get.showOverlay(
                      asyncFunction: () async {
                        File temp = File(value.path);

                        var pickedImage =
                            await decodeImageFromList(temp.readAsBytesSync());

                        print("${pickedImage.width} ${pickedImage.height}");

                        if (pickedImage.height <= 700 &&
                            pickedImage.width <= 700) {
                          //a
                          await uploadImg(value.path, value);
                          //a
                        } else {
                          print("hehe");

                          var ddir = await getApplicationDocumentsDirectory();
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
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
                  },
                );
              },
            ),
            // //
            // const SizedBox(),
            // // CircularProgressIndicator(),
            // ClickableWidget(
            //   widget: Column(
            //     children: [
            //       const CircleAvatar(
            //         radius: 50,
            //         backgroundColor: CupertinoColors.destructiveRed,
            //         child: Icon(
            //           CupertinoIcons.camera_viewfinder,
            //           size: 70,
            //         ),
            //       ).animate().fadeIn(duration: 350.ms).slideY().scale(),
            //       const SizedBox(
            //         height: 15,
            //       ),
            //       const Text(
            //         "촬영 모드",
            //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //       ),
            //     ],
            //   ),
            //   onTap: () {
            //     Get.toNamed(Routes.CAMERA_PAGE);
            //   },
            // ),
            // const SizedBox(),
            // Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //     child: Image.asset("assets/logo2.png")
            //         .animate()
            //         .fadeIn(duration: 350.ms))
            // // .color(duration: 2000.ms),
          ],
        ),
      ),
    );
  }
}

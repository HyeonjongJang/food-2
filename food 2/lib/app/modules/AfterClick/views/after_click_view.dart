// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:ui';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food/custom_button.dart';
import 'package:function_tree/function_tree.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../main.dart';
import '../../../data/data.dart';
import '../controllers/after_click_controller.dart';

String matchhhh(String key) {
  // print(key);

  // print(myDaata[key]);
  // print(
  //   myDaata.keys
  //       .toList()
  //       .map((e) => e.toLowerCase())
  //       .toList()
  //       .indexOf(key.toLowerCase()),
  // );
  // print(myDaata["honey-filled Rice cake"]);

  // print(
  //     "68 ${myDaata.keys.elementAt(68)}\n68 ${myDaata.values.elementAt(68)} ");

  //    print(
  // "68 ${myDaata.keys.elementAt(68)}\n68 ${myDaata.values.elementAt(68)} ");

  // print(
  //     "res ${myDaata.keys.elementAt(myDaata.keys.toList().map((e) => e.toLowerCase()).toList().indexOf(key.toLowerCase()))}");
  return myDaata.keys.elementAt(myDaata.keys
      .toList()
      .map((e) => e.toLowerCase())
      .toList()
      .indexOf(key.toLowerCase()));
}

class AfterClickView extends GetView<AfterClickController> {
  const AfterClickView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          // backgroundColor: Colors.white24,
          // floatingActionButton: FloatingActionButton(onPressed: () {
          //   // print(matchhhh("honey-filled Rice cake"));

          //   controller.selectedSize.value =
          //       (0.80 + (PortionSize.small.index.toDouble() * 0.20));
          //   print(controller.selectedSize.value);
          // }),

          //   //  myDaata[e.key
          //   //                                             .replaceAll(',', '')
          //   //                                             .trim()]
          // }),
          extendBodyBehindAppBar: true,
          appBar: const MyAppbar(),

          //  AppBar(
          //   backgroundColor: Colors.white12,
          //   title: Text(
          //     controller.selectedIndex.value.toString(),
          //     style: const TextStyle(color: Colors.transparent),
          //   ),
          //   // centerTitle: true,
          //   actions: [
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //       child: Image.asset(
          //         "assets/logon.png",
          //         height: 30,
          //       ),
          //     ),
          //   ],
          //   bottom: PreferredSize(
          //     preferredSize: const Size.fromHeight(50.0),
          //     child: SizedBox(
          //       height: 50,
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Divider(
          //             color: Colors.grey.withOpacity(0.5),
          //             height: 0,
          //           ),
          //           // Container(
          //           //   color: Colors.grey.shade300,
          //           //   height: 1.0,
          //           // ),
          //           const Text(
          //             '식사요약',
          //             style:
          //                 TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //           ),
          //           Divider(
          //             color: Colors.grey.withOpacity(0.5),
          //             height: 0,
          //           ),
          //         ],
          //       ),
          //     ),

          //     // surfaceTintColor: Colors.transparent,
          //   ),
          // ),

          body:
              // controller.isLoading.value
              //     ? const Center(
              //         child: CupertinoActivityIndicator(
              //         radius: 50,
              //       ))
              //     :
              Stack(
            children: [
              Image.file(
                File(controller.file.path),
                fit: BoxFit.fill,
                height: Get.height,
                width: Get.width,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 500, sigmaY: 500),
                child: Container(
                  color: Colors.white24,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            height: 140,
                          ),
                          Container(
                            width: Get.width * 0.9,
                            height: Get.height * 0.3,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                // image: DecorationImage(
                                //   invertColors: controller.selectedIndex.value == 2,
                                //   image: FileImage(File(
                                //     controller.file.path,
                                //   )),
                                //   fit: BoxFit.fill,
                                // ),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(
                                        0,
                                        20,
                                      ),
                                      spreadRadius: 0,
                                      blurRadius: 30,
                                      color: Colors.black12)
                                ]),

                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: PageView(
                                onPageChanged: (value) {
                                  controller.selectedIndex.value = value;
                                },
                                // itemCount: 3,
                                controller: controller.pageController,
                                // itemBuilder: (context, index) {
                                //   // return Text(
                                //   //   "http://3.38.243.237${Get.arguments["img"]}",
                                //   // );
                                //   return Image.network(
                                //     "http://3.38.243.237${controller.res.transformedImage}",
                                //     fit: BoxFit.fill,
                                //   );
                                // },
                                children: [
                                  // CachedNetworkImage(
                                  //   imageUrl:
                                  //       "$baseUrl${controller.res.transformedImage}",
                                  //   placeholder: (context, url) =>
                                  //       // CircularProgressIndicator(),
                                  //       const CupertinoActivityIndicator(
                                  //     color: Colors.amber,
                                  //     radius: 50,
                                  //   ),
                                  //   errorWidget: (context, url, error) =>
                                  //       const Icon(
                                  //     Icons.error,
                                  //     color: Colors.amber,
                                  //   ),
                                  //   fit: BoxFit.fill,
                                  // ),
                                  ClickableWidget(
                                    widget: Image.network(
                                      "$baseUrl${controller.res.transformedImage}",
                                      fit: BoxFit.fill,
                                    ),
                                    onTap: () {
                                      Get.dialog(
                                          BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 10, sigmaY: 10),
                                              child: Center(
                                                child: SizedBox(
                                                  width: Get.width * 0.90,
                                                  height: Get.height * 0.3,
                                                  child: PhotoView(
                                                    imageProvider: NetworkImage(
                                                        "$baseUrl${controller.res.transformedImage}"),
                                                  )
                                                      .animate()
                                                      .scale(
                                                          duration: 200.ms,
                                                          curve:
                                                              Curves.decelerate)
                                                      .fade(
                                                          duration: 250.ms,
                                                          curve: Curves.easeIn),
                                                ),
                                              )),
                                          barrierDismissible: false);

                                      // Get.to(() => ImgFView(
                                      //       path:
                                      //           "$baseUrl${controller.res.transformedImage}",
                                      //     ));
                                    },
                                  ),
                                  ClickableWidget(
                                    onTap: () {
                                      Get.dialog(
                                          BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 10, sigmaY: 10),
                                              child: Center(
                                                child: SizedBox(
                                                  width: Get.width * 0.90,
                                                  height: Get.height * 0.3,
                                                  child: PhotoView(
                                                          imageProvider:
                                                              FileImage(File(
                                                                  controller
                                                                      .file
                                                                      .path)))
                                                      .animate()
                                                      .scale(
                                                          duration: 200.ms,
                                                          curve:
                                                              Curves.decelerate)
                                                      .fade(
                                                          duration: 250.ms,
                                                          curve: Curves.easeIn),
                                                ),
                                              )),
                                          barrierDismissible: false);

                                      // Get.to(() => ImgFView(
                                      //       file: File(controller.file.path),
                                      //       // path:
                                      //       //     "$baseUrl${controller.res.transformedImage}",
                                      //     ));
                                    },
                                    widget: ColorFiltered(
                                      colorFilter: const ColorFilter.mode(
                                        Colors
                                            .black, // 0 = Colored, 1 = Black & White
                                        BlendMode.saturation,
                                      ),
                                      child: Image.file(
                                        File(controller.file.path),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  ClickableWidget(
                                    onTap: () {
                                      Get.dialog(
                                          BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 10, sigmaY: 10),
                                              child: Center(
                                                child: SizedBox(
                                                  width: Get.width * 0.90,
                                                  height: Get.height * 0.3,
                                                  child: PhotoView(
                                                          imageProvider:
                                                              FileImage(File(
                                                                  controller
                                                                      .file
                                                                      .path)))
                                                      .animate()
                                                      .scale(
                                                          duration: 200.ms,
                                                          curve:
                                                              Curves.decelerate)
                                                      .fade(
                                                          duration: 250.ms,
                                                          curve: Curves.easeIn),
                                                ),
                                              )),
                                          barrierDismissible: false);

                                      // Get.to(() => ImgFView(
                                      //       file: File(controller.file.path),
                                      //       // path:
                                      //       //     "$baseUrl${controller.res.transformedImage}",
                                      //     ));
                                    },
                                    widget: Image.file(
                                      File(controller.file.path),
                                      fit: BoxFit.fill,
                                    ),
                                  ),

                                  // FileImage()),
                                ],
                              ),
                            ),
                            // child: ClipRRect(
                            //     borderRadius: BorderRadius.circular(15),
                            //     child: Image.file(
                            //       File(
                            //         controller.file.path,
                            //       ),
                            //       fit: BoxFit.fill,
                            //     )),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 50,
                            child: Center(
                                child: ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: ClickableWidget(
                                      onPressZoomPer: -30,
                                      widget: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              // invertColors: index == 2,
                                              image: NetworkImage(
                                                  "$baseUrl${controller.res.transformedImage}"),

                                              //  FileImage(
                                              //   File(
                                              //     controller.file.path,
                                              //   ),
                                              // ),
                                              fit: BoxFit.fill,
                                            ),
                                            border: Border.all(
                                                color: controller.selectedIndex
                                                            .value ==
                                                        0
                                                    ? Colors.amber.shade700
                                                    : Colors.transparent,
                                                width: 2.5),
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                      onTap: () {
                                        controller.selectedIndex.value = 0;
                                        controller.pageController.animateToPage(
                                            0,
                                            duration: const Duration(
                                                milliseconds: 350),
                                            curve: Curves.easeIn);
                                      },
                                    ),
                                  ),
                                  //
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: ClickableWidget(
                                      onPressZoomPer: -30,
                                      widget: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: ColorFiltered(
                                          colorFilter: const ColorFilter.mode(
                                            Colors
                                                .black, // 0 = Colored, 1 = Black & White
                                            BlendMode.saturation,
                                          ),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                // invertColors: index == 2,
                                                image: FileImage(
                                                    File(controller.file.path)),

                                                //  FileImage(
                                                //   File(
                                                //     controller.file.path,
                                                //   ),
                                                // ),
                                                fit: BoxFit.fill,
                                              ),
                                              border: Border.all(
                                                  color: controller
                                                              .selectedIndex
                                                              .value ==
                                                          1
                                                      ? Colors.amber.shade700
                                                      : Colors.transparent,
                                                  width: 2.5),
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        controller.selectedIndex.value = 1;
                                        controller.pageController.animateToPage(
                                            1,
                                            duration: const Duration(
                                                milliseconds: 350),
                                            curve: Curves.easeIn);
                                      },
                                    ),
                                  ),

                                  //
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: ClickableWidget(
                                      onPressZoomPer: -30,
                                      widget: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              // invertColors: index == 2,
                                              image: FileImage(
                                                  File(controller.file.path)),

                                              //  FileImage(
                                              //   File(
                                              //     controller.file.path,
                                              //   ),
                                              // ),
                                              fit: BoxFit.fill,
                                            ),
                                            border: Border.all(
                                                color: controller.selectedIndex
                                                            .value ==
                                                        2
                                                    ? Colors.amber.shade700
                                                    : Colors.transparent,
                                                width: 2.5),
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                      onTap: () {
                                        controller.selectedIndex.value = 2;
                                        controller.pageController.animateToPage(
                                            2,
                                            duration: const Duration(
                                                milliseconds: 350),
                                            curve: Curves.easeIn);
                                      },
                                    ),
                                  )
                                ]

                                    // itemBuilder: (context, index) {
                                    //   return Padding(
                                    //     padding:
                                    //         const EdgeInsets.symmetric(horizontal: 15),
                                    //     child: ClickableWidget(
                                    //       onPressZoomPer: -30,
                                    //       widget: Container(
                                    //         height: 50,
                                    //         width: 50,
                                    //         decoration: BoxDecoration(
                                    //             image: DecorationImage(
                                    //               // invertColors: index == 2,
                                    //               image: NetworkImage(
                                    //                   "http://3.38.243.237${controller.res.transformedImage}"),

                                    //               //  FileImage(
                                    //               //   File(
                                    //               //     controller.file.path,
                                    //               //   ),
                                    //               // ),
                                    //               fit: BoxFit.fill,
                                    //             ),
                                    //             border: Border.all(
                                    //                 color: controller
                                    //                             .selectedIndex.value ==
                                    //                         index
                                    //                     ? Colors.amber.shade700
                                    //                     : Colors.transparent,
                                    //                 width: 2.5),
                                    //             color: Colors.black,
                                    //             borderRadius:
                                    //                 BorderRadius.circular(15)),
                                    //       ),
                                    //       onTap: () {
                                    //         controller.selectedIndex.value = index;
                                    //         controller.pageController.animateToPage(
                                    //             index,
                                    //             duration:
                                    //                 const Duration(milliseconds: 350),
                                    //             curve: Curves.easeIn);
                                    //       },
                                    //     ),
                                    //   );
                                    // },
                                    )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Divider(
                            color: Colors.grey.withOpacity(0.5),
                          ),
// "" "" ""
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                            child: Center(
                                child: ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: ClickableWidget(
                                      onPressZoomPer: -30,
                                      widget: Transform.scale(
                                        scale: controller.selectedPortionSize
                                                    .value ==
                                                PortionSize.small
                                            ? 1.15
                                            : 1,
                                        child: Container(
                                          height: 50,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              boxShadow: controller
                                                          .selectedPortionSize
                                                          .value ==
                                                      PortionSize.small
                                                  ? [
                                                      BoxShadow(
                                                          offset: const Offset(
                                                              -4, -4),
                                                          blurRadius: 25,
                                                          color: Colors
                                                              .amber.shade900
                                                              .withOpacity(
                                                                  0.5)),
                                                      BoxShadow(
                                                          offset: const Offset(
                                                              4, 4),
                                                          blurRadius: 25,
                                                          color: Colors
                                                              .amber.shade100
                                                              .withOpacity(0.5))
                                                    ]
                                                  : [],
                                              gradient: LinearGradient(
                                                  colors: [
                                                    // Colors.amber.shade400,
                                                    // Colors.amber.shade700,
                                                    // Colors.amber.shade800,
                                                    // Colors.amber.shade900,
                                                    Colors.amber.shade100,
                                                    Colors.amber.shade300,
                                                    Colors.amber.shade500,
                                                    Colors.amber.shade900,
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  stops: const [
                                                    0.1,
                                                    0.4,
                                                    0.6,
                                                    0.9
                                                  ]),
                                              border: Border.all(
                                                  color: controller
                                                              .selectedPortionSize
                                                              .value ==
                                                          PortionSize.small
                                                      ? Colors.orange.shade900
                                                      : Colors.transparent,
                                                  width: 2.5),
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: const Center(
                                            child: Text("상",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 25)),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        controller.selectedPortionSize.value =
                                            PortionSize.small;
                                      },
                                    ),
                                  ),
                                  //
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: ClickableWidget(
                                      onPressZoomPer: -30,
                                      widget: Transform.scale(
                                        scale: controller.selectedPortionSize
                                                    .value ==
                                                PortionSize.medium
                                            ? 1.15
                                            : 1,
                                        child: Container(
                                          height: 50,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              boxShadow: controller
                                                          .selectedPortionSize
                                                          .value ==
                                                      PortionSize.medium
                                                  ? [
                                                      BoxShadow(
                                                          offset: const Offset(
                                                              -4, -4),
                                                          blurRadius: 25,
                                                          color: Colors
                                                              .amber.shade900
                                                              .withOpacity(
                                                                  0.5)),
                                                      BoxShadow(
                                                          offset: const Offset(
                                                              4, 4),
                                                          blurRadius: 25,
                                                          color: Colors
                                                              .amber.shade100
                                                              .withOpacity(0.5))
                                                    ]
                                                  : [],
                                              gradient: LinearGradient(
                                                  colors: [
                                                    // Colors.amber.shade400,
                                                    // Colors.amber.shade700,
                                                    // Colors.amber.shade800,
                                                    // Colors.amber.shade900,
                                                    Colors.amber.shade100,
                                                    Colors.amber.shade300,
                                                    Colors.amber.shade500,
                                                    Colors.amber.shade900,
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  stops: const [
                                                    0.1,
                                                    0.4,
                                                    0.6,
                                                    0.9
                                                  ]),
                                              border: Border.all(
                                                  color: controller
                                                              .selectedPortionSize
                                                              .value ==
                                                          PortionSize.medium
                                                      ? Colors.orange.shade900
                                                      : Colors.transparent,
                                                  width: 2.5),
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: const Center(
                                            child: Text("중",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 25)),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        controller.selectedPortionSize.value =
                                            PortionSize.medium;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: ClickableWidget(
                                      onPressZoomPer: -30,
                                      widget: Transform.scale(
                                        scale: controller.selectedPortionSize
                                                    .value ==
                                                PortionSize.large
                                            ? 1.15
                                            : 1,
                                        child: Container(
                                          height: 50,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              boxShadow: controller
                                                          .selectedPortionSize
                                                          .value ==
                                                      PortionSize.large
                                                  ? [
                                                      BoxShadow(
                                                          offset: const Offset(
                                                              -4, -4),
                                                          blurRadius: 25,
                                                          color: Colors
                                                              .amber.shade900
                                                              .withOpacity(
                                                                  0.5)),
                                                      BoxShadow(
                                                          offset: const Offset(
                                                              4, 4),
                                                          blurRadius: 25,
                                                          color: Colors
                                                              .amber.shade100
                                                              .withOpacity(0.5))
                                                    ]
                                                  : [],
                                              gradient: LinearGradient(
                                                  colors: [
                                                    // Colors.amber.shade400,
                                                    // Colors.amber.shade700,
                                                    // Colors.amber.shade800,
                                                    // Colors.amber.shade900,
                                                    Colors.amber.shade100,
                                                    Colors.amber.shade300,
                                                    Colors.amber.shade500,
                                                    Colors.amber.shade900,
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  stops: const [
                                                    0.1,
                                                    0.4,
                                                    0.6,
                                                    0.9
                                                  ]),
                                              border: Border.all(
                                                  color: controller
                                                              .selectedPortionSize
                                                              .value ==
                                                          PortionSize.large
                                                      ? Colors.orange.shade900
                                                      : Colors.transparent,
                                                  width: 2.5),
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: const Center(
                                            child: Text("하",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 25)),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        controller.selectedPortionSize.value =
                                            PortionSize.large;
                                      },
                                    ),
                                  ),
                                ])),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // ...controller
                          //     .res.plateFood!.boundingBoxes!.remjs!.entries
                          //     .map((e) => Text(e.key.replaceAll(',', '')))
                          //     .toList(),

                          ...controller
                              .res.plateFood!.pixelCount!.itemsJson!.entries
                              .map(
                            (e) => Column(
                              children: [
                                GestureDetector(
                                  onLongPress: () {
                                    print("Long press down");
                                    controller.isCodeVisible.value = true;
                                    HapticFeedback.heavyImpact();
                                  },
                                  onLongPressUp: () {
                                    print("Long press up");
                                    HapticFeedback.lightImpact();
                                    controller.isCodeVisible.value = false;
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    // height: Get.width * 0.4,
                                    width: Get.width * 0.9,
                                    decoration: BoxDecoration(
                                        color: Colors.white24,
                                        // gradient: const LinearGradient(
                                        //     colors: [
                                        //       // Colors.amber.shade400,
                                        //       // Colors.amber.shade700,
                                        //       // Colors.amber.shade800,
                                        //       // Colors.amber.shade900,
                                        //       Colors.white54,
                                        //       Colors.white60,
                                        //       Colors.white70,
                                        //       Colors.white,
                                        //     ],
                                        //     end: Alignment.topLeft,
                                        //     begin: Alignment.bottomRight,
                                        //     stops: [0.1, 0.4, 0.6, 0.9]),

                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            width: 3,
                                            color: Colors.amber.shade900
                                                .withOpacity(0.1))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e.key
                                              .replaceAll(',', '')
                                              .capitalizeFirst!,
                                          // controller.resMod.data.text.food.name,
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.amber.shade700),
                                        ),
                                        const Divider(color: Colors.white38
                                            // Colors.amber.shade900
                                            //     .withOpacity(0.3)

                                            ),

                                        //serving

                                        //                                  print(myDaata.values.first["calorie"]!
                                        // .substring(
                                        //   7,
                                        // )
                                        // .interpret());
                                        // Text(e.key),
                                        // Text(matchhhh(
                                        //     e.key.replaceAll(',', ''))),
                                        // Text(myDaata[
                                        //         "honey-filled rice cake"]
                                        //     .toString()),
                                        // Text(myDaata[matchhhh(
                                        //         e.key.replaceAll(',', ''))]
                                        //     .toString()),
                                        // myDaata[e.key
                                        //             .replaceAll(',', '')
                                        //             .trim()] !=
                                        //         null
                                        //     ?

                                        controller.isCodeVisible.value
                                            ? const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "",
                                                        style: TextStyle(
                                                          fontSize: 22,
                                                          // fontWeight: FontWeight.bold,
                                                          // color: Colors.amber.shade700,
                                                        ),
                                                      ),
                                                      Text(
                                                        "총 섭취량 : pixelCount *  portionSize * weight from server ",
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          // fontWeight: FontWeight.bold,
                                                          // color: Colors.amber.shade700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  // Text(myDaata[
                                                  //         "honey-filled rice cake"]
                                                  //     .toString()),
                                                  // Text(myDaata[e.key
                                                  //         .replaceAll(
                                                  //             ',', '')
                                                  //         .trim()]
                                                  //     .toString()),
                                                  //Kcal
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "",
                                                        // "총 칼로리 : ${(e.value * 0.00271 * 3.98).toStringAsFixed(2)} Kcal",
                                                        style: TextStyle(
                                                          fontSize: 22,
                                                          // fontWeight: FontWeight.bold,
                                                          // color: Colors.amber.shade700,
                                                        ),
                                                      ),
                                                      Text(
                                                        "총 칼로리 : pixelCount *  portionSize * calories from server ",
                                                        // "총 칼로리 : ${(e.value * 0.00271 * 3.98).toStringAsFixed(2)} Kcal",
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          // fontWeight: FontWeight.bold,
                                                          // color: Colors.amber.shade700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  // // 지방량 : ((pixel count)*0.00271(g))*0.21(g)
                                                  // //carb

                                                  Row(
                                                    children: [
                                                      Text(
                                                        "",
                                                        // "총 칼로리 : ${(e.value * 0.00271 * 3.98).toStringAsFixed(2)} Kcal",
                                                        style: TextStyle(
                                                          fontSize: 22,
                                                          // fontWeight: FontWeight.bold,
                                                          // color: Colors.amber.shade700,
                                                        ),
                                                      ),
                                                      Text(
                                                        "탄수화물량 : pixelCount *  portionSize * carbohydrate from server",
                                                        // "총 칼로리 : ${(e.value * 0.00271 * 3.98).toStringAsFixed(2)} Kcal",
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          // fontWeight: FontWeight.bold,
                                                          // color: Colors.amber.shade700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  // protien
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "",
                                                        // "총 칼로리 : ${(e.value * 0.00271 * 3.98).toStringAsFixed(2)} Kcal",
                                                        style: TextStyle(
                                                          fontSize: 22,
                                                          // fontWeight: FontWeight.bold,
                                                          // color: Colors.amber.shade700,
                                                        ),
                                                      ),
                                                      Text(
                                                        "단백질 양 : pixelCount *  portionSize * protein from server ",
                                                        // "총 칼로리 : ${(e.value * 0.00271 * 3.98).toStringAsFixed(2)} Kcal",
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          // fontWeight: FontWeight.bold,
                                                          // color: Colors.amber.shade700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  //fat province

                                                  Row(
                                                    children: [
                                                      Text(
                                                        "",
                                                        // "총 칼로리 : ${(e.value * 0.00271 * 3.98).toStringAsFixed(2)} Kcal",
                                                        style: TextStyle(
                                                          fontSize: 22,
                                                          // fontWeight: FontWeight.bold,
                                                          // color: Colors.amber.shade700,
                                                        ),
                                                      ),
                                                      Text(
                                                        "지방량 : pixelCount *  portionSize * fat from server ",
                                                        // "총 칼로리 : ${(e.value * 0.00271 * 3.98).toStringAsFixed(2)} Kcal",
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          // fontWeight: FontWeight.bold,
                                                          // color: Colors.amber.shade700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "총 섭취량 : ${(e.value * 0.00271 * (0.80 + (controller.selectedPortionSize.value.index.toDouble() * 0.20))).toStringAsFixed(2)} g",
                                                    style: const TextStyle(
                                                      fontSize: 22,
                                                      // fontWeight: FontWeight.bold,
                                                      // color: Colors.amber.shade700,
                                                    ),
                                                  ),

                                                  // Text(myDaata[
                                                  //         "honey-filled rice cake"]
                                                  //     .toString()),
                                                  // Text(myDaata[e.key
                                                  //         .replaceAll(
                                                  //             ',', '')
                                                  //         .trim()]
                                                  //     .toString()),
                                                  //Kcal
                                                  Text(
                                                    "총 칼로리 : ${(e.value * 0.00271 * (0.80 + (controller.selectedPortionSize.value.index.toDouble() * 0.20)) * myDaata[matchhhh(e.key.replaceAll(',', ''))]!["calorie"]!.substring(
                                                          7,
                                                        ).interpret()).toStringAsFixed(2)} Kcal",
                                                    // "총 칼로리 : ${(e.value * 0.00271 * 3.98).toStringAsFixed(2)} Kcal",
                                                    style: const TextStyle(
                                                      fontSize: 22,
                                                      // fontWeight: FontWeight.bold,
                                                      // color: Colors.amber.shade700,
                                                    ),
                                                  ),

                                                  // // 지방량 : ((pixel count)*0.00271(g))*0.21(g)
                                                  // //carb
                                                  Text(
                                                    "탄수화물량 : ${(e.value * 0.00271 * (0.80 + (controller.selectedPortionSize.value.index.toDouble() * 0.20)) * myDaata[matchhhh(e.key.replaceAll(',', ''))]!["carbohydrate"]!.substring(
                                                          7,
                                                        ).interpret()).toStringAsFixed(2)} g",
                                                    // "탄수화물량 : ${(e.value * 0.00271 * 0.43).toStringAsFixed(2)} g",
                                                    style: const TextStyle(
                                                      fontSize: 22,
                                                      // fontWeight: FontWeight.bold,
                                                      // color: Colors.amber.shade700,
                                                    ),
                                                  ),
                                                  // protien
                                                  Text(
                                                    "단백질 양 : ${(e.value * 0.00271 * (0.80 + (controller.selectedPortionSize.value.index.toDouble() * 0.20)) * myDaata[matchhhh(e.key.replaceAll(',', ''))]!["protein"]!.substring(
                                                          7,
                                                        ).interpret()).toStringAsFixed(2)} g",

                                                    // "단백질 양 : ${(e.value * 0.00271 * 0.067).toStringAsFixed(2)} g",
                                                    style: const TextStyle(
                                                      fontSize: 22,
                                                      // fontWeight: FontWeight.bold,
                                                      // color: Colors.amber.shade700,
                                                    ),
                                                  ),
                                                  //fat province
                                                  Text(
                                                    "지방량 : ${(e.value * 0.00271 * (0.80 + (controller.selectedPortionSize.value.index.toDouble() * 0.20)) * myDaata[matchhhh(e.key.replaceAll(',', ''))]!["province"]!.substring(
                                                          7,
                                                        ).interpret()).toStringAsFixed(2)} g",
                                                    style: const TextStyle(
                                                      fontSize: 22,
                                                      // fontWeight: FontWeight.bold,
                                                      // color: Colors.amber.shade700,
                                                    ),
                                                  ),
                                                ],
                                              )
                                        // : Text("-")
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
// boundingBoxes?.remjs?.keys
                          // .toList()
                          ...controller
                              .res.packagedFood!.boundingBoxes!.remjs!.keys
                              .toList()
                              .map((e) => Column(
                                    children: [
                                      GestureDetector(
                                        onLongPress: () {
                                          print("Long press down");
                                          HapticFeedback.heavyImpact();
                                          controller.isCodeVisible.value = true;
                                        },
                                        onLongPressUp: () {
                                          print("Long press up");
                                          HapticFeedback.lightImpact();
                                          controller.isCodeVisible.value =
                                              false;
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(20),
                                          // height: Get.width * 0.4,
                                          width: Get.width * 0.9,
                                          decoration: BoxDecoration(
                                              color: Colors.white24,
                                              // gradient: const LinearGradient(
                                              //     colors: [
                                              //       // Colors.amber.shade400,
                                              //       // Colors.amber.shade700,
                                              //       // Colors.amber.shade800,
                                              //       // Colors.amber.shade900,
                                              //       Colors.white54,
                                              //       Colors.white60,
                                              //       Colors.white70,
                                              //       Colors.white,
                                              //     ],
                                              //     end: Alignment.topLeft,
                                              //     begin: Alignment.bottomRight,
                                              //     stops: [0.1, 0.4, 0.6, 0.9]),

                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              border: Border.all(
                                                  width: 3,
                                                  color: Colors.amber.shade900
                                                      .withOpacity(0.1))),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                e.toString().capitalizeFirst!,
                                                // controller.resMod.data.text.food.name,
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        Colors.amber.shade700),
                                              ),
                                              const Divider(
                                                  color: Colors.white38
                                                  // Colors.amber.shade900
                                                  //     .withOpacity(0.3)

                                                  ),
                                              controller.isCodeVisible.value
                                                  ? const Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "",
                                                              style: TextStyle(
                                                                fontSize: 22,
                                                                // fontWeight: FontWeight.bold,
                                                                // color: Colors.amber.shade700,
                                                              ),
                                                            ),
                                                            Text(
                                                              "총 섭취량 : packedFood , data from database",
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                                // fontWeight: FontWeight.bold,
                                                                // color: Colors.amber.shade700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        // Text(myDaata[
                                                        //         "honey-filled rice cake"]
                                                        //     .toString()),
                                                        // Text(myDaata[e.key
                                                        //         .replaceAll(
                                                        //             ',', '')
                                                        //         .trim()]
                                                        //     .toString()),
                                                        //Kcal
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "",
                                                              // "총 칼로리 : ${(e.value * 0.00271 * 3.98).toStringAsFixed(2)} Kcal",
                                                              style: TextStyle(
                                                                fontSize: 22,
                                                                // fontWeight: FontWeight.bold,
                                                                // color: Colors.amber.shade700,
                                                              ),
                                                            ),
                                                            Text(
                                                              "총 칼로리 : packedFood , data from database",
                                                              // "총 칼로리 : ${(e.value * 0.00271 * 3.98).toStringAsFixed(2)} Kcal",
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                                // fontWeight: FontWeight.bold,
                                                                // color: Colors.amber.shade700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        // // 지방량 : ((pixel count)*0.00271(g))*0.21(g)
                                                        // //carb

                                                        Row(
                                                          children: [
                                                            Text(
                                                              "",
                                                              // "총 칼로리 : ${(e.value * 0.00271 * 3.98).toStringAsFixed(2)} Kcal",
                                                              style: TextStyle(
                                                                fontSize: 22,
                                                                // fontWeight: FontWeight.bold,
                                                                // color: Colors.amber.shade700,
                                                              ),
                                                            ),
                                                            Text(
                                                              "탄수화물량 : packedFood , data from database",
                                                              // "총 칼로리 : ${(e.value * 0.00271 * 3.98).toStringAsFixed(2)} Kcal",
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                                // fontWeight: FontWeight.bold,
                                                                // color: Colors.amber.shade700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        // protien
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "",
                                                              // "총 칼로리 : ${(e.value * 0.00271 * 3.98).toStringAsFixed(2)} Kcal",
                                                              style: TextStyle(
                                                                fontSize: 22,
                                                                // fontWeight: FontWeight.bold,
                                                                // color: Colors.amber.shade700,
                                                              ),
                                                            ),
                                                            Text(
                                                              "단백질 양 : packedFood , data from database",
                                                              // "총 칼로리 : ${(e.value * 0.00271 * 3.98).toStringAsFixed(2)} Kcal",
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                                // fontWeight: FontWeight.bold,
                                                                // color: Colors.amber.shade700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        //fat province

                                                        Row(
                                                          children: [
                                                            Text(
                                                              "",
                                                              // "총 칼로리 : ${(e.value * 0.00271 * 3.98).toStringAsFixed(2)} Kcal",
                                                              style: TextStyle(
                                                                fontSize: 22,
                                                                // fontWeight: FontWeight.bold,
                                                                // color: Colors.amber.shade700,
                                                              ),
                                                            ),
                                                            Text(
                                                              "지방량 : packedFood , data from database",
                                                              // "총 칼로리 : ${(e.value * 0.00271 * 3.98).toStringAsFixed(2)} Kcal",
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                                // fontWeight: FontWeight.bold,
                                                                // color: Colors.amber.shade700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  : Column(
                                                      children: [
                                                        Text(
                                                          "총 섭취량 :  ${(double.parse(controller.preData[e]!["amount"]!) * (0.80 + (controller.selectedPortionSize.value.index.toDouble() * 0.20))).toStringAsFixed(2)} g",
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 22,
                                                            // fontWeight: FontWeight.bold,
                                                            // color: Colors.amber.shade700,
                                                          ),
                                                        ),
                                                        Text(
                                                          //  "calorie": "216.00",
                                                          // "carbohydrate": "54.00",
                                                          // "protein": "0.00",
                                                          // "province": "0.00"

                                                          // "a",
                                                          "총 칼로리 : ${(double.parse(controller.preData[e]!["calorie"]!) * (0.80 + (controller.selectedPortionSize.value.index.toDouble() * 0.20))).toStringAsFixed(2)} Kcal",
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 22,
                                                            // fontWeight: FontWeight.bold,
                                                            // color: Colors.amber.shade700,
                                                          ),
                                                        ),
                                                        //card\b

                                                        Text(
                                                          "탄수화물량 : ${(double.parse(controller.preData[e]!["carbohydrate"]!) * (0.80 + (controller.selectedPortionSize.value.index.toDouble() * 0.20))).toStringAsFixed(2)} g",
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 22,
                                                            // fontWeight: FontWeight.bold,
                                                            // color: Colors.amber.shade700,
                                                          ),
                                                        ),
                                                        //protin

                                                        Text(
                                                          "단백질 양 : ${(double.parse(controller.preData[e]!["protein"]!) * (0.80 + (controller.selectedPortionSize.value.index.toDouble() * 0.20))).toStringAsFixed(2)} g",
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 22,
                                                            // fontWeight: FontWeight.bold,
                                                            // color: Colors.amber.shade700,
                                                          ),
                                                        ),

                                                        Text(
                                                          "지방량 : ${(double.parse(controller.preData[e]!["province"]!) * (0.80 + (controller.selectedPortionSize.value.index.toDouble() * 0.20))).toStringAsFixed(2)} g",
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 22,
                                                            // fontWeight: FontWeight.bold,
                                                            // color: Colors.amber.shade700,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  )),
                          // Text(controller
                          //     .res.plateFood!.boundingBoxes!.remjs!.length
                          //     .toString()),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
    //   return Scaffold(
    //     appBar: AppBar(
    //       title: const Text(
    //         '식사요약',
    //         style: TextStyle(fontWeight: FontWeight.bold),
    //       ),
    //       centerTitle: true,
    //     ),
    //     body: Column(
    //       children: [
    //         ClickableWidget(
    //           onTap: () {
    //             Get.toNamed(Routes.OUTPUT_PAGE,
    //                 arguments: {"image": controller.file});
    //           },
    //           widget: Container(
    //               width: Get.width,
    //               height: Get.width,
    //               // decoration:
    //               //     BoxDecoration(borderRadius: BorderRadius.circular(15)),
    //               child: Padding(
    //                 padding: const EdgeInsets.all(16.0),
    //                 child: ClipRRect(
    //                     borderRadius: BorderRadius.circular(15),
    //                     child: Image.file(
    //                       File(
    //                         controller.file.path,
    //                       ),
    //                       fit: BoxFit.fill,
    //                     )),
    //               )),
    //         ),
    //         const SizedBox(
    //           height: 50,
    //         ),
    //         const Text("Some text")
    //       ],
    //     ),
    //   );
  }
}

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: AppBar(
          surfaceTintColor: Colors.transparent,
          // toolbarHeight: ,
          backgroundColor: Colors.white24,
          title: Text(
            0.toString(),
            style: const TextStyle(color: Colors.transparent),
          ),
          // centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Image.asset(
                "assets/logon.png",
                height: 30,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: SizedBox(
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Divider(
                    color: Colors.grey.withOpacity(0.5),
                    height: 0,
                  ),
                  // Container(
                  //   color: Colors.grey.shade300,
                  //   height: 1.0,
                  // ),
                  const Text(
                    '식사요약',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.5),
                    height: 0,
                  ),
                ],
              ),
            ),

            // surfaceTintColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}

class ImgFView extends StatelessWidget {
  final String? path;
  final File? file;
  const ImgFView({super.key, this.path, this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: path != null
            ? PhotoView(
                imageProvider: NetworkImage(path!),
              )
            : PhotoView(imageProvider: FileImage(file!)));
  }
}

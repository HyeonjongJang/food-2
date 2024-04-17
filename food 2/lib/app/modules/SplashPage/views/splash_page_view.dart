import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food/app/modules/ShotingModePage/views/shoting_mode_page_view.dart';

import 'package:get/get.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({super.key});

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 1200), () {
      // setState(() {
      Navigator.pushReplacement(
          context, PageTransition(const ShotingModePageView()));
      // });
    });
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double _width = MediaQuery.of(context).size.width;
    // double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white, // themeColor.shade200,
      body: Center(
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 1200),
            curve: Curves.fastLinearToSlowEaseIn,
            // height: _width / _containerSize,
            // width: _width / _containerSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            // child: Image.asset('assets/images/file_name.png')
            child: Image.asset(
              "assets/logon.png",
              width: Get.width * 0.8,
            ).animate().fadeIn(duration: 1000.ms).scale()
            // const Text(
            //   'YOUR APP\'S LOGO',
            // ),
            ),
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}

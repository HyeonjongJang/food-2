// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/AfterClick/bindings/after_click_binding.dart';
import '../modules/AfterClick/views/after_click_view.dart';
import '../modules/CameraPage/bindings/camera_page_binding.dart';
import '../modules/CameraPage/views/camera_page_view.dart';
import '../modules/LaunchPage/bindings/launch_page_binding.dart';
import '../modules/LaunchPage/views/launch_page_view.dart';
import '../modules/OutputPage/bindings/output_page_binding.dart';
import '../modules/OutputPage/views/output_page_view.dart';
import '../modules/ShotingModePage/bindings/shoting_mode_page_binding.dart';
import '../modules/ShotingModePage/views/shoting_mode_page_view.dart';
import '../modules/SplashPage/bindings/splash_page_binding.dart';
import '../modules/SplashPage/views/splash_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_PAGE;

  static final routes = [
    GetPage(
        name: _Paths.SPLASH_PAGE,
        page: () => const SplashPageView(),
        binding: SplashPageBinding(),
        transition: Transition.size),
    GetPage(
        name: _Paths.LAUNCH_PAGE,
        page: () => const LaunchPageView(),
        binding: LaunchPageBinding(),
        transition: Transition.size),
    GetPage(
        name: _Paths.SHOTING_MODE_PAGE,
        page: () => const ShotingModePageView(),
        binding: ShotingModePageBinding(),
        transition: Transition.size),
    GetPage(
      name: _Paths.CAMERA_PAGE,
      page: () => const CameraPageView(),
      binding: CameraPageBinding(),
    ),
    GetPage(
      name: _Paths.OUTPUT_PAGE,
      page: () => const OutputPageView(),
      binding: OutputPageBinding(),
    ),
    GetPage(
      name: _Paths.AFTER_CLICK,
      page: () => const AfterClickView(),
      binding: AfterClickBinding(),
    ),
  ];
}

// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:kta/route/route_name.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    Future.delayed(Duration(seconds: 1), () {
      Get.offNamed(Routes.register);
    });
    super.onInit();
  }
}

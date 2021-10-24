import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kta/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.name.value)),
      ),
      body: Container(),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kta/controller/event_controller.dart';
import 'package:kta/controller/otp_controller.dart';
import 'package:kta/provider/auth_provider.dart';
import 'package:kta/provider/event_provider.dart';
import 'package:kta/repository/auth_repository.dart';

class EventBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventController>(() => EventController(EventProvider(Dio())));
  }
}

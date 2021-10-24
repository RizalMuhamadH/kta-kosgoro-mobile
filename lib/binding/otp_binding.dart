import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kta/controller/auth_controller.dart';
import 'package:kta/controller/otp_controller.dart';
import 'package:kta/provider/auth_provider.dart';
import 'package:kta/repository/auth_repository.dart';

class OtpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OTPController>(
        () => OTPController(AuthRepository(AuthProvider(Dio()))));
  }
}

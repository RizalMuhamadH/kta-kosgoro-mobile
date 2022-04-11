import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kta/route/route_name.dart';
import 'package:logger/logger.dart';
import 'package:kta/repository/auth_repository.dart';
import 'package:kta/service/pref_service.dart';

class OTPController extends GetxController {
  final AuthRepository repository;
  OTPController(this.repository);

  final isLoading = false.obs;
  final ctrlOtp = TextEditingController().obs;

  auth() async {
    dialogProgressBar();
    await repository
        .auth(email: PrefService.get().getEmail(), password: ctrlOtp.value.text)
        .then((value) {
      if (value.code == 200) {
        // Pref().setNip(value.noMember ?? "");
        // Pref().setToken(value.token ?? "");
        PrefService.get().setAuth(true);

        Get.back(closeOverlays: true);
        Get.offAllNamed(Routes.home);
      } else {
        Get.back(closeOverlays: true);
        snackbar(value.message!);
      }
    }, onError: (e) {
      Logger().e(e);
      Get.back(closeOverlays: true);
    }).catchError((e) {
      Logger().e(e);
      Get.back(closeOverlays: true);
    });
  }

  snackbar(String message) {
    Get.snackbar("Error", message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[400],
        barBlur: 0,
        colorText: Colors.white,
        margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8));
  }

  dialogProgressBar() {
    Get.generalDialog(
        barrierDismissible: false,
        barrierColor: Colors.black45,
        pageBuilder: (_, a1, a2) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    // Get.back(closeOverlays: true);
  }
}

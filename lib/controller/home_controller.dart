// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kta/repository/user_repository.dart';
import 'package:kta/route/route_name.dart';
import 'package:kta/service/one_signal.dart';
import 'package:kta/service/pref_service.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  final UserRepository repository;

  HomeController(this.repository);

  final nip = "".obs;
  final name = "".obs;
  final district = "".obs;

  @override
  void onInit() async {
    // await Get.putAsync(() => PrefService().init());
    // await Get.putAsync(() => OneSignalService().init());
    // TODO: implement onInit
    PrefService.get().setUser({
      "name": "rizal",
      "no_member": "AQ6pPrM7j1nm",
      "token": "94b519e7-f77e-475d-97ab-e81cd8f4cb66"
    });
    if (PrefService.get().getStatus() == "0") {
      checkStatus();
    }
    super.onInit();
  }

  checkStatus() async {
    await repository.checkStatus().then((value) {
      Logger().e(value.toJson());
      if (value.code == 200) {
        if (value.map['token'] == null) {
          dialogDeletedPost();
        }
        PrefService.get().setStatus(value.map['status']);
      }
    }, onError: (e) {
      Logger().e(e);
      // Get.back(closeOverlays: true);
    }).catchError((e) {
      Logger().e(e);
      // Get.back(closeOverlays: true);
    });
  }

  dialogDeletedPost() {
    Get.defaultDialog(
      content: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Material(
          type: MaterialType.transparency,
          child: Text(
            "Anda belum terdaftar menjadi anggota. Segera lakukan pendaftaran!",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ),
      onCustom: () {},
      confirmTextColor: Colors.black87,
      buttonColor: Colors.white,
      textConfirm: 'Daftar',
      textCustom: 'Admin',
      onConfirm: () {
        Get.toNamed(Routes.register);
      },
    );
  }
}

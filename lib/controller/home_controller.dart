// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kta/repository/elasticsearch_repository.dart';
import 'package:kta/repository/user_repository.dart';
import 'package:kta/route/route_name.dart';
import 'package:kta/service/one_signal.dart';
import 'package:kta/service/pref_service.dart';
import 'package:logger/logger.dart';
import 'package:screenshot/screenshot.dart';

class HomeController extends GetxController {
  final UserRepository repository;
  final ElasticsearchRepository elasticsearch;

  HomeController(this.repository, this.elasticsearch);

  final nip = "".obs;
  final name = "".obs;
  final province = "".obs;
  final position = "".obs;
  final status = "".obs;
  final qrcode = "".obs;
  final photo = "".obs;
  final state = 0.obs;

  final screenshotController = ScreenshotController();

  @override
  void onInit() async {
    // await Get.putAsync(() => PrefService().init());
    // await Get.putAsync(() => OneSignalService().init());
    // TODO: implement onInit
    // PrefService.get().setNip("2021.1025.15");
    // PrefService.get().setToken("94b519e7-f77e-475d-97ab-e81cd8f4cb66");
    if (PrefService.get().getStatus() == "0") {
      checkStatus();
    } else {
      getMember();
    }
    super.onInit();
  }

  getMember() async {
    await elasticsearch.getMember(PrefService.get().getNip()).then((value) {
      Logger().e(value["_source"]);
      name.value = value["_source"]['name'];
      nip.value = PrefService.get().getNip();
      province.value = value["_source"]['province'];
      position.value = value["_source"]['position'];
      qrcode.value = value["_source"]['qrcode'];
      photo.value = value["_source"]['photo'];
      final stat = value["_source"]['status'];
      state.value = stat;
      if (stat == 1) {
        status.value = "Diverifikasi";
      } else if (stat == 2) {
        status.value = "Diblok";
      } else if (stat == 3) {
        status.value = "Diverifikasi";
      }
    }, onError: (e) {
      Logger().e(e);
      // Get.back(closeOverlays: true);
    }).catchError((e) {
      Logger().e(e);
      // Get.back(closeOverlays: true);
    });
  }

  checkStatus() async {
    await repository.checkStatus().then((value) {
      Logger().e(value.toJson());
      if (value.code == 200) {
        if (value.map!['token'] == null) {
          dialogDeletedPost();
          return;
        }

        if (value.map!['status'] == "0") {
          photo.value = value.map!['photo'];
          name.value = value.map!['name'];
          province.value = value.map!['province'];
        }

        if (value.map!['status'] != "0") {
          PrefService.get().setNip(value.map!['no_member']);
          PrefService.get().setToken(value.map!['token']);
          getMember();
        }
        PrefService.get().setStatus(value.map!['status']);
        state.value = value.map!['status'];
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

  logout() {
    PrefService.get().remove();
    Get.offAllNamed(Routes.login);
  }
}

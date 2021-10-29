import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kta/repository/elasticsearch_repository.dart';
import 'package:logger/logger.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRcodeController extends GetxController {
  final ElasticsearchRepository repository;

  QRcodeController(this.repository);

  final status = "".obs;
  final name = "".obs;
  final nip = "".obs;
  final district = "".obs;
  final position = "".obs;
  final qrcode = "".obs;
  final photo = "".obs;

  final isLoading = false.obs;

  final qrKey = GlobalKey(debugLabel: 'QR');

  getMember(String id) async {
    isLoading.value = true;
    await repository.getMember(id).then((value) {
      Logger().e(value["_source"]);
      name.value = value["_source"]['name'];
      nip.value = id;
      district.value = value["_source"]['district'];
      position.value = value["_source"]['position'];
      qrcode.value = value["_source"]['qrcode'];
      photo.value = value["_source"]['photo'];
      final stat = value["_source"]['status'];
      if (stat == 1) {
        status.value = "Diverifikasi";
      } else if (stat == 2) {
        status.value = "Diblok";
      } else if (stat == 3) {
        status.value = "Diverifikasi";
      }

      isLoading.value = false;
    }, onError: (e) {
      Logger().e(e);

      isLoading.value = false;
      // Get.back(closeOverlays: true);
    }).catchError((e) {
      Logger().e(e);

      isLoading.value = false;
      // Get.back(closeOverlays: true);
    });
  }
}

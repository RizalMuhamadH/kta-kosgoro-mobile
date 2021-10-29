// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kta/config/constant.dart';
import 'package:kta/controller/home_controller.dart';
import 'package:kta/route/route_name.dart';
import 'package:kta/service/pref_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: Get.height * 0.66,
                  child: Stack(
                    children: [
                      Container(
                        height: Get.height * 0.5,
                        width: double.infinity,
                        decoration: BoxDecoration(color: primaryColor),
                        child: Image.asset(
                          "assets/bg/texture-png.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          top: Get.height * 0.13,
                          left: Get.width * 0.34,
                          right: Get.width * 0.34,
                          child: Container(
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "assets/logo/logo.png",
                              height: 90,
                              width: 90,
                            ),
                          )),
                      Positioned(
                          top: Get.height * 0.44,
                          left: 0,
                          right: 0,
                          child: Card(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 95,
                                    height: 100,
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.nip.value,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          controller.name.value,
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          controller.district.value,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          )),
                      Positioned(
                        top: Get.height * 0.39,
                        child: Container(
                          margin: EdgeInsets.only(left: 28),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)),
                          width: 90.3,
                          height: 115.21,
                          child: Image.network(
                              "$STORAGE_URL/${controller.photo.value}"),
                        ),
                      ),
                      AppBar(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        leading: GestureDetector(
                          onTap: () {
                            controller.logout();
                          },
                          child: Icon(
                            Icons.logout_rounded,
                            color: Colors.white,
                          ),
                        ),
                        actions: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.scan);
                            },
                            child: Icon(
                              Icons.qr_code_scanner_rounded,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "KARTU ANGGOTA",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                Screenshot(
                    child: cardMember(),
                    controller: controller.screenshotController),
                Container(
                  margin: const EdgeInsets.only(
                      bottom: 50, top: 50, left: 20, right: 20),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor)),
                      onPressed: () async {
                        final image = await controller.screenshotController
                            .captureFromWidget(cardMember());
                        final directory =
                            await getApplicationDocumentsDirectory();
                        final imagePath = await File(
                                '${directory.path}/${controller.name.toLowerCase().replaceAll(" ", "_")}.png')
                            .create();
                        await imagePath.writeAsBytes(image);

                        /// Share Plugin
                        Share.shareFiles([imagePath.path]);
                        print(imagePath.path);
                        // controller.register();
                      },
                      child: Text(
                        "Cetak Kartu Anggota",
                        style: TextStyle(color: Colors.white),
                      )),
                  width: Get.width,
                ),
              ],
            ),
          )),
    );
  }

  cardMember() => Obx(() => controller.state.value == "0"
      ? Center(
          child: Text(
            "Kartu belum Terverifikasi",
            style: TextStyle(fontSize: 20),
          ),
        )
      : Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: Image.asset(
                      "assets/bg/bg_card.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, right: 12, left: 16),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              controller.nip.value,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              controller.name.value,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              controller.district.value,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            Text(
                              controller.status.value,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  color: Colors.grey[200],
                                  height: 50,
                                  width: 50,
                                  child: SvgPicture.network(
                                      "$STORAGE_URL/${controller.qrcode.value}"),
                                )),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            "assets/logo/logo.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ));
}

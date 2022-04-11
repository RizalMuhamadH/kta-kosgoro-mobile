// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kta/config/constant.dart';
import 'package:kta/controller/home_controller.dart';
import 'package:kta/route/route_name.dart';
import 'package:kta/service/pref_service.dart';
import 'package:kta/view/section/navigation_drawer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
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
                                          controller.province.value,
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
                        iconTheme: IconThemeData(color: Colors.white),
                        backgroundColor: Colors.transparent,
                        // leading: GestureDetector(
                        //   onTap: () {
                        //     controller.logout();
                        //   },
                        //   child: Icon(
                        //     Icons.logout_rounded,
                        //     color: Colors.white,
                        //   ),
                        // ),
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
                Obx(() => controller.state.value == 0
                    ? SizedBox()
                    : Container(
                        margin: const EdgeInsets.only(
                            bottom: 50, top: 50, left: 20, right: 20),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(primaryColor)),
                            onPressed: () async {
                              final image = await controller
                                  .screenshotController
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
                      )),
              ],
            ),
          )),
    );
  }

  cardMember() => Obx(() => controller.state.value == 0
      ? Center(
          child: Text(
            "Kartu belum Terverifikasi",
            style: TextStyle(fontSize: 20),
          ),
        )
      : Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/bg/texture-png.png"),
                        fit: BoxFit.cover,
                      ),
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 8, top: 8, bottom: 8, right: 16),
                        padding: EdgeInsets.only(
                            top: 5, bottom: 5, left: 5, right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          "assets/logo/logo.png",
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "KARTU ANGGOTA",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "KOSGORO 1957",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8, right: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          width: 90.3,
                          height: 90,
                          child: Image.network(
                              "$STORAGE_URL/${controller.photo.value}"),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, right: 12, left: 16),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // SizedBox(
                                  //   height: 20,
                                  // ),
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
                                    controller.province.value,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12),
                                  ),
                                  // Text(
                                  //   controller.status.value,
                                  //   style: TextStyle(
                                  //       color: Colors.black, fontSize: 12),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        )),
                        Obx(() => Align(
                              alignment: Alignment.topRight,
                              child: Column(
                                children: [
                                  Image.asset(
                                    controller.state.value == 1
                                        ? "assets/logo/kosgoro-verifikasi.png"
                                        : "assets/logo/kosgoro-not-verifikasi.png",
                                    height: 30,
                                    width: 30,
                                  ),
                                  Text(controller.status.value,
                                      style: TextStyle(
                                          color: Colors.red[800],
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            )),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text("Ketua Umum :",
                                  style: TextStyle(fontSize: 10)),
                              Container(
                                child: Image.asset(
                                  "assets/logo/ttd-dave.png",
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              Text("Dave AF Laksono",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )),
                      Positioned(
                          bottom: 8,
                          right: 0,
                          child: Container(
                            color: Colors.grey[200],
                            height: 50,
                            width: 50,
                            child: SvgPicture.network(
                                "$STORAGE_URL/${controller.qrcode.value}"),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ));
}

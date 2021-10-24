// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kta/config/constant.dart';
import 'package:kta/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "NIK",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Nama",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Domisili",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12),
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
                    ),
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Card(
                  elevation: 50,
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
                            top: 16, bottom: 8, right: 18, left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Image.asset(
                                "assets/logo/logo.png",
                                height: 40,
                                width: 40,
                              ),
                            ),
                            Text(
                              "NIK",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Nama",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Domisili",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            Text(
                              "Status",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  color: Colors.grey[200],
                                  height: 50,
                                  width: 50,
                                )),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

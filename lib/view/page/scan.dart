// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kta/config/constant.dart';
import 'package:kta/controller/qrcode_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends GetView<QRcodeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  QRView(
                      key: controller.qrKey,
                      overlay: QrScannerOverlayShape(
                          borderColor: Colors.amber,
                          borderRadius: 10,
                          borderLength: 20,
                          borderWidth: 10,
                          cutOutSize: Get.width * 0.5),
                      onQRViewCreated: (qrcontroller) {
                        qrcontroller.scannedDataStream.listen((scanData) {
                          print(scanData);
                          controller.getMember(scanData.code);
                        });
                      }),
                  AppBar(
                    iconTheme: IconThemeData(color: Colors.white),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: Text(
                      "Scan",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 20, top: 8),
                        child: Text(
                          "KARTU ANGGOTA",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                    Obx(() => controller.isLoading.value == false
                        ? controller.name.value != ""
                            ? Container(
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
                                              top: 8,
                                              bottom: 8,
                                              right: 12,
                                              left: 16),
                                          child: Stack(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    controller.nip.value,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    controller.name.value,
                                                    style: TextStyle(
                                                        color: primaryColor,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    controller.district.value,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12),
                                                  ),
                                                  Text(
                                                    controller.status.value,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12),
                                                  ),
                                                  Align(
                                                      alignment:
                                                          Alignment.bottomRight,
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
                              )
                            : SizedBox()
                        : Center(
                            child: CircularProgressIndicator(),
                          ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

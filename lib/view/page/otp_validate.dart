// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kta/config/constant.dart';
import 'package:kta/controller/otp_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPValidatePage extends GetView<OTPController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Masukan 6 digit kode verifikasi yang dikirimkan ke email",
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 70,
            ),
            PinCodeTextField(
              controller: controller.ctrlOtp.value,
              length: 6,
              appContext: context,
              animationType: AnimationType.fade,
              animationDuration: Duration(milliseconds: 300),
              keyboardType: TextInputType.multiline,
              pinTheme: PinTheme(
                  fieldHeight: 50,
                  fieldWidth: 40,
                  inactiveColor: primaryColor,
                  activeFillColor: primaryColor,
                  activeColor: primaryColor),
              onChanged: (v) {
                if (v.length == 6) {
                  controller.auth();
                }
              },
            ),
            SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Kirim Ulang",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

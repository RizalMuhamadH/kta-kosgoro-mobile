// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kta/config/constant.dart';
import 'package:kta/controller/auth_controller.dart';

class LoginPage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // centerTitle: true,
        // backgroundColor: Colors.white,
        // title: Text(
        //   "Selamat Datang",
        //   style: TextStyle(
        //       color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18),
        // ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Masuk",
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Masuk menggunakan email terlebih dahulu",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: controller.ctrlEmail.value,
                  style: TextStyle(fontSize: 12),
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    hintText: 'Email',
                    fillColor: Colors.grey[300],
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                  onChanged: (value) {
                    // inputStr = value;
                  },
                  onSubmitted: (_) {
                    // dispatchConcrete();
                  },
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor)),
                  onPressed: () {
                    controller.otpGenerate();
                  },
                  child: Text(
                    "Masuk",
                    style: TextStyle(color: Colors.white),
                  )),
              width: Get.width,
            ),
          ],
        ),
      ),
    );
  }
}

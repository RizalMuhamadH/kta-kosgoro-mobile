// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kta/config/constant.dart';
import 'package:kta/controller/auth_controller.dart';
import 'package:kta/route/route_name.dart';

class LoginPage extends GetView<AuthController> {
  LoginPage({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                "Masuk menggunakan metode login menggunakan email atau username",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.ctrlUsername.value,
                style: TextStyle(fontSize: 12),
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  hintText: 'Username',
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
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.ctrlPassword.value,
                style: TextStyle(fontSize: 12),
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.none,
                obscureText: true,
                autocorrect: false,
                enableSuggestions: false,
                decoration: InputDecoration(
                  labelText: "Password",
                  isDense: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  hintText: 'Password',
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
              Container(
                margin: const EdgeInsets.only(bottom: 50, top: 200),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor)),
                    onPressed: () {
                      controller.signUpUser();
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    )),
                width: Get.width,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor)),
                    onPressed: () {
                      Get.toNamed(Routes.registerAccount);
                    },
                    child: Text(
                      "Buat Akun",
                      style: TextStyle(color: Colors.white),
                    )),
                width: Get.width,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: GestureDetector(
                  child: Text(
                    "Masuk Menggunakan Email",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  onTap: () {
                    Get.toNamed(Routes.loginOtp);
                  },
                ),
                width: Get.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

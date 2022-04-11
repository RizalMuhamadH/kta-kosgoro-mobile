// ignore_for_file: prefer_const_constructors, invalid_use_of_protected_member

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kta/config/constant.dart';
import 'package:kta/model/complimentary.dart';
import 'package:logger/logger.dart';
import 'package:kta/controller/auth_controller.dart';

class RegisterAccountPage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        // title: Text(
        //   "Daftar",
        //   style: TextStyle(color: Colors.black),
        // ),
      ),
      body: SingleChildScrollView(
        child: Obx(() => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Register Account",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Username",
                  ),
                  TextField(
                    controller: controller.ctrlUsername.value,
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: 'Username',
                      fillColor: Colors.grey[300],
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Email",
                  ),
                  TextField(
                    controller: controller.ctrlEmail.value,
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
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
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Password",
                  ),
                  TextField(
                    controller: controller.ctrlPassword.value,
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
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
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 50, top: 100),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor)),
                        onPressed: () {
                          controller.registerAccount();
                        },
                        child: Text(
                          "Daftar",
                          style: TextStyle(color: Colors.white),
                        )),
                    width: Get.width,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

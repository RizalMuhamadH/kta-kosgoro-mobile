// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:kta/controller/auth_controller.dart';

class LoginPage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text(
          "Masuk",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Masuk menggunakan email",
              textAlign: TextAlign.center,
            ),
            TextField(
              // controller: controller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)),
                hintText: 'Email',
                fillColor: Colors.grey,
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
      ),
    );
  }
}

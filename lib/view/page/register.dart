// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:kta/controller/auth_controller.dart';

class RegisterPage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text(
          "Daftar",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nik",
            ),
            TextField(
              // controller: controller,
              style: TextStyle(fontSize: 12),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)),
                hintText: 'Nik',
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
              height: 16,
            ),
            Text(
              "Nama Lengkap",
            ),
            TextField(
              // controller: controller,

              style: TextStyle(fontSize: 12),
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)),
                hintText: 'Nama Lengkap',
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
              height: 16,
            ),
            Text(
              "Telepon",
            ),
            TextField(
              // controller: controller,
              style: TextStyle(fontSize: 12),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)),
                hintText: 'Telepon',
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
      ),
    );
  }
}

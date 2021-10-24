// ignore_for_file: prefer_const_constructors, invalid_use_of_protected_member

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kta/config/constant.dart';
import 'package:kta/model/complimentary.dart';
import 'package:logger/logger.dart';
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
                    "Daftar",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Nik",
                  ),
                  TextField(
                    controller: controller.ctrlNik.value,
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: 'Nik',
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
                    "Nama Lengkap",
                  ),
                  TextField(
                    controller: controller.ctrlName.value,
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
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
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Telepon",
                  ),
                  TextField(
                    controller: controller.ctrlPhone.value,
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      isDense: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      hintText: '08xxxxxxxxxxx',
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
                    "Alamat",
                  ),
                  TextField(
                    controller: controller.ctrlAddress.value,
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      isDense: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      hintText: 'Alamat',
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
                    "Provinsi",
                  ),
                  DropdownSearch<Complimentary>(
                    dropdownSearchDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      isDense: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      fillColor: Colors.grey[300],
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                    mode: Mode.MENU,
                    itemAsString: (item) => item!.name ?? "",
                    // showSelectedItems: true,
                    items: controller.province,
                    loadingBuilder: (context, text) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    onChanged: (item) {
                      controller.getDistrict(item!.id!);
                      controller.ctrlProvince.value = item.id!;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Kabupaten/Kota",
                  ),
                  DropdownSearch<Complimentary>(
                    dropdownSearchDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      isDense: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      fillColor: Colors.grey[300],
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                    mode: Mode.MENU,
                    // showSelectedItems: true,
                    items: controller.district,
                    loadingBuilder: (context, text) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    itemAsString: (item) => item!.name ?? "",
                    onChanged: (item) {
                      controller.getSubDistrict(item!.id!);
                      controller.ctrlDistrict.value = item.id!;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Kecamatan",
                  ),
                  DropdownSearch<Complimentary>(
                    dropdownSearchDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      isDense: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      fillColor: Colors.grey[300],
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                    mode: Mode.MENU,
                    // showSelectedItems: true,
                    itemAsString: (item) => item!.name ?? "",
                    items: controller.subDistrict,
                    loadingBuilder: (context, text) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    onChanged: (item) {
                      controller.getVillage(item!.id!);
                      controller.ctrlSubDistrict.value = item.id!;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Desa",
                  ),
                  DropdownSearch<Complimentary>(
                    dropdownSearchDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      isDense: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      fillColor: Colors.grey[300],
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                    mode: Mode.MENU,
                    // showSelectedItems: true,
                    itemAsString: (item) => item!.name ?? "",
                    items: controller.village,
                    loadingBuilder: (context, text) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    onChanged: (item) {
                      controller.ctrlVillage.value = item!.id!;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pas Foto",
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.filepicker(TypeField.avatar);
                                Logger().e("tap");
                              },
                              child: TextField(
                                controller: controller.ctrlPhoto.value,
                                enabled: false,
                                style: TextStyle(fontSize: 16),
                                keyboardType: TextInputType.none,
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.teal)),
                                  hintText: 'Pilih Foto',
                                  fillColor: Colors.grey[300],
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Foto KTP",
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.filepicker(TypeField.identity);
                              },
                              child: TextField(
                                enabled: false,
                                controller: controller.ctrlPhotoidentity.value,
                                style: TextStyle(fontSize: 16),
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.teal)),
                                  hintText: 'Pilih Foto',
                                  fillColor: Colors.grey[300],
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 50, top: 100),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor)),
                        onPressed: () {
                          controller.register();
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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kta/model/complimentary.dart';
import 'package:kta/repository/auth_repository.dart';
import 'package:kta/route/route_name.dart';
import 'package:kta/service/pref_service.dart';
import 'package:logger/logger.dart';

class AuthController extends GetxController {
  final AuthRepository repository;
  AuthController(this.repository);

  final ctrlEmail = TextEditingController().obs;
  final ctrlName = TextEditingController().obs;
  final ctrlAddress = TextEditingController().obs;
  final ctrlPhone = TextEditingController().obs;
  final ctrlNik = TextEditingController().obs;
  final ctrlProvince = 0.obs;
  final ctrlDistrict = 0.obs;
  final ctrlSubDistrict = 0.obs;
  final ctrlVillage = 0.obs;
  final ctrlPhoto = TextEditingController().obs;
  final ctrlPhotoidentity = TextEditingController().obs;
  final isLoading = false.obs;

  final avatar = File("").obs;
  final identity = File("").obs;

  final province = <Complimentary>[].obs;
  final district = <Complimentary>[].obs;
  final subDistrict = <Complimentary>[].obs;
  final village = <Complimentary>[].obs;

  getProvince() async {
    await repository.getProvince().then((value) {
      province.clear();
      province.addAll(value);
      province.refresh();
    }, onError: (e) {
      Logger().e(e);
      isLoading.value = false;
    }).catchError((e) {
      Logger().e(e);
      isLoading.value = false;
    });
  }

  getDistrict(int id) async {
    await repository.getDistrict(id).then((value) {
      district.clear();
      district.addAll(value);
      district.refresh();
    }, onError: (e) {
      Logger().e(e);
      isLoading.value = false;
    }).catchError((e) {
      Logger().e(e);
      isLoading.value = false;
    });
  }

  getSubDistrict(int id) async {
    await repository.getSubDistrict(id).then((value) {
      subDistrict.clear();
      subDistrict.addAll(value);
      subDistrict.refresh();
    }, onError: (e) {
      Logger().e(e);
      isLoading.value = false;
    }).catchError((e) {
      Logger().e(e);
      isLoading.value = false;
    });
  }

  getVillage(int id) async {
    await repository.getVillage(id).then((value) {
      village.clear();
      village.addAll(value);
      village.refresh();
    }, onError: (e) {
      Logger().e(e);
      isLoading.value = false;
    }).catchError((e) {
      Logger().e(e);
      isLoading.value = false;
    });
  }

  register() async {
    if (ctrlName.value.text != "" &&
        ctrlNik.value.text != "" &&
        ctrlAddress.value.text != "" &&
        ctrlPhone.value.text != "" &&
        ctrlPhoto.value.text != "" &&
        ctrlPhotoidentity.value.text != "" &&
        ctrlProvince.value != 0 &&
        ctrlDistrict.value != 0 &&
        ctrlSubDistrict.value != 0 &&
        ctrlVillage.value != 0) {
      dialogProgressBar();
      await repository
          .register(
              name: ctrlName.value.text,
              email: PrefService.get().getEmail(),
              phone: ctrlPhone.value.text,
              nik: ctrlNik.value.text,
              address: ctrlAddress.value.text,
              province: ctrlProvince.value,
              district: ctrlDistrict.value,
              subDistrict: ctrlSubDistrict.value,
              village: ctrlVillage.value,
              photo: avatar.value,
              identity: identity.value)
          .then((value) {
        if (value.code == 200) {
          PrefService.get().setUser(value.map as Map<String, dynamic>);
          Get.offAllNamed(Routes.home);
        } else {
          Get.back();
          snackbar(value.message!);
        }
      }, onError: (e) {
        Logger().e(e);
        Get.back(closeOverlays: true);
      }).catchError((e) {
        Logger().e(e);
        Get.back(closeOverlays: true);
      });
    } else {
      snackbar("Lengkapi seluruh field");
    }
  }

  otpGenerate() async {
    if (validateEmail(ctrlEmail.value.text)) {
      isLoading.value = true;
      await repository.otpGenerate(ctrlEmail.value.text).then((value) {
        if (value.code == 200) {
          Logger().e(value.message);
          PrefService.get().setEmail(ctrlEmail.value.text);
          // Pref().setNip(value.noMember!);

          Get.toNamed(Routes.otpValidate);
        } else {
          snackbar(value.message!);
        }
        isLoading.value = false;
      }, onError: (e) {
        Logger().e(e);
        isLoading.value = false;
      }).catchError((e) {
        Logger().e(e);
        isLoading.value = false;
      });
    } else {
      Logger().e("Salah");
      snackbar("Email Salah");
    }
  }

  snackbar(String message) {
    Get.snackbar("Error", message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[400],
        duration: const Duration(seconds: 3),
        barBlur: 0,
        colorText: Colors.white,
        margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8));
  }

  bool validateEmail(String value) {
    const pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    return !regex.hasMatch(value) ? false : true;
  }

  filepicker(TypeField type) async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final file = File(result.path);
      final size = file.lengthSync();
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);
      final name = result.name;

      if (type == TypeField.avatar) {
        avatar.value = file;
        ctrlPhoto.value.text = name;
      }

      if (type == TypeField.identity) {
        identity.value = file;
        ctrlPhotoidentity.value.text = name;
      }
    }
  }

  dialogProgressBar() {
    Get.generalDialog(
        barrierDismissible: false,
        barrierColor: Colors.black45,
        pageBuilder: (_, a1, a2) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    // Get.back(closeOverlays: true);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getProvince();
    super.onInit();
  }
}

enum TypeField { avatar, identity }

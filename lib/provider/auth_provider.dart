import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kta/config/constant.dart';
import 'package:kta/model/complimentary.dart';
import 'package:kta/model/json_response.dart';
import 'package:logger/logger.dart';

class AuthProvider {
  final Dio dio;

  AuthProvider(this.dio);

  Future<ResponseData> otpGenerate(String email) async {
    try {
      final res = await dio.post("$BASE_URL/generate_otp",
          data: FormData.fromMap({"email": email}));

      return ResponseData.fromJson(res.data);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<ResponseData> auth(String email, String token) async {
    try {
      final res = await dio.post("$BASE_URL/login/member",
          data: FormData.fromMap(
              {"password": token, "email": email, "api": true}));
      Logger().i(res.data);
      return ResponseData.fromJson(res.data);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<ResponseData> createCard(
      String name,
      String email,
      String phone,
      String nik,
      String address,
      int province,
      int district,
      int subDistrict,
      int village,
      File photo,
      File identity,
      String postCode) async {
    try {
      final res = await dio.post("$BASE_URL/create/member",
          data: FormData.fromMap({
            "name": name,
            "email": email,
            "phone": phone,
            "nik": nik,
            "address": address,
            "province": province,
            "district": district,
            "sub_district": subDistrict,
            "village": village,
            "photo": MultipartFile.fromFileSync(".${photo.path}"),
            "id_card": MultipartFile.fromFileSync(".${identity.path}"),
            "position": 3,
            "post_code": 0,
            "api": true
          }),
          options: Options(headers: {
            "accept": "*/*",
            // "Content-Type":
            //     "multipart/form-data; boundary=<calculated when request is sent>"
          }, contentType: "multipart/form-data"));
      return ResponseData.fromJson(res.data);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<List<Complimentary>> getProvince() async {
    try {
      final res = await dio.get("$BASE_URL/province");
      Logger().e(res.data);
      final list = res.data as List;
      return list.map<Complimentary>((e) => Complimentary.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<List<Complimentary>> getDistrict(int id) async {
    try {
      final res = await dio.get("$BASE_URL/district?province_id=$id");
      Logger().e(res.data);
      final list = res.data as List;
      return list.map<Complimentary>((e) => Complimentary.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<List<Complimentary>> getSubDistrict(int id) async {
    try {
      final res = await dio.get("$BASE_URL/subDistrict?district_id=$id");
      Logger().e(res.data);
      final list = res.data as List;
      return list.map<Complimentary>((e) => Complimentary.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<List<Complimentary>> getVillage(int id) async {
    try {
      final res = await dio.get("$BASE_URL/getVillage?sub_district_id=$id");
      Logger().e(res.data);
      final list = res.data as List;
      return list.map<Complimentary>((e) => Complimentary.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}

import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kta/config/constant.dart';
import 'package:kta/model/json_response.dart';

class AuthProvider {
  final Dio dio;

  AuthProvider(this.dio);

  FutureOr<ResponseData> OTPGenerate(String email) async {
    try {
      final res = await dio.post("$BASE_URL/generate_otp",
          data: FormData.fromMap({"email": email}));

      return ResponseData.fromJson(res.data);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  FutureOr<ResponseData> auth(String email, String token) async {
    try {
      final res = await dio.post("$BASE_URL/login/member",
          data: FormData.fromMap(
              {"password": token, "email": email, "api": true}));
      return ResponseData.fromJson(res.data);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  FutureOr<ResponseData> createCard(
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
      final res = await dio.post("$BASE_URL/login/member",
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
}

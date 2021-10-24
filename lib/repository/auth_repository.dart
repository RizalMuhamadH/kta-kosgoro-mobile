import 'dart:async';
import 'dart:io';

import 'package:kta/model/complimentary.dart';
import 'package:kta/model/json_response.dart';
import 'package:kta/provider/auth_provider.dart';

class AuthRepository {
  final AuthProvider provider;

  AuthRepository(this.provider);

  Future<ResponseData> register(
          {required String name,
          required String email,
          required String phone,
          required String nik,
          required String address,
          required int province,
          required int district,
          required int subDistrict,
          required int village,
          required File photo,
          required File identity,
          String postCode = ""}) async =>
      await provider.createCard(name, email, phone, nik, address, province,
          district, subDistrict, village, photo, identity, postCode);

  Future<ResponseData> otpGenerate(String email) async =>
      await provider.otpGenerate(email);

  Future<ResponseData> auth(
          {required String email, required String token}) async =>
      await provider.auth(email, token);

  Future<List<Complimentary>> getProvince() async => provider.getProvince();
  Future<List<Complimentary>> getDistrict(int id) async =>
      provider.getDistrict(id);
  Future<List<Complimentary>> getSubDistrict(int id) async =>
      provider.getSubDistrict(id);
  Future<List<Complimentary>> getVillage(int id) async =>
      provider.getVillage(id);
}

import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

const token = 'token';
const nip = 'nip';
const email = 'email';
const isLogin = 'is_login';
const user = 'user';
const status = 'status';

class PrefService extends GetxService {
  static PrefService get() => Get.find();

  SharedPreferences? prefs;

  Future<PrefService> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  String getToken() {
    final uuid = prefs!.getString(token);
    if (uuid == null) return "";
    return uuid;
  }

  setToken(String uuid) async {
    await prefs!.setString(token, uuid);
  }

  String getNip() {
    final data = prefs!.getString(nip);
    if (data == null) return "";
    return data;
  }

  setNip(String data) async {
    await prefs!.setString(nip, data);
  }

  String getEmail() {
    final data = prefs!.getString(email);
    return data ?? "";
  }

  setEmail(String data) async {
    await prefs!.setString(email, data);
  }

  String getStatus() {
    final data = prefs!.getString(status);
    return data ?? "0";
  }

  setStatus(String data) async {
    await prefs!.setString(status, data);
  }

  bool getAuth() {
    final data = prefs!.getBool(isLogin);
    if (data == null) return false;
    return data;
  }

  setAuth(bool data) async {
    await prefs!.setBool(isLogin, data);
  }

  dynamic getUser() {
    final data = prefs!.getString(user);
    return jsonDecode(data!) ?? "";
  }

  setUser(Map<String, dynamic> data) async {
    await prefs!.setString(user, jsonEncode(data));
  }

  remove() async {
    await prefs!.clear();
  }
}

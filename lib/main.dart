// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kta/binding/auth_binding.dart';
import 'package:kta/route/app.dart';
import 'package:kta/route/route_name.dart';
import 'package:kta/service/one_signal.dart';

void main() {
  initService();
  runApp(MyApp());
}

initService() async {
  await Get.putAsync(() => OneSignalService().init());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          centerTitle: true,
          actionsIconTheme: IconThemeData(
            color: Colors.red,
          ),
          iconTheme: IconThemeData(
            color: Color(0XFF8B8B8B),
          ),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      getPages: App.routes,
      initialBinding: AuthBinding(),
      initialRoute: Routes.splash,
    );
  }
}

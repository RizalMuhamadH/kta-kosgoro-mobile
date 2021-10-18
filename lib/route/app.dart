import 'package:get/get.dart';
import 'package:kta/binding/auth_binding.dart';
import 'package:kta/binding/splash_binding.dart';
import 'package:kta/route/route_name.dart';
import 'package:kta/view/page/login.dart';
import 'package:kta/view/page/register.dart';
import 'package:kta/view/page/splash.dart';

class App {
  static final routes = [
    GetPage(
        name: Routes.splash,
        page: () => SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.login, page: () => LoginPage(), binding: AuthBinding()),
    GetPage(
        name: Routes.register,
        page: () => RegisterPage(),
        binding: AuthBinding())
  ];
}

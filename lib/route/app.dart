import 'package:get/get.dart';
import 'package:kta/binding/auth_binding.dart';
import 'package:kta/binding/event_binding.dart';
import 'package:kta/binding/home_binding.dart';
import 'package:kta/binding/news_binding.dart';
import 'package:kta/binding/otp_binding.dart';
import 'package:kta/binding/qrcode_binding.dart';
import 'package:kta/binding/splash_binding.dart';
import 'package:kta/middleware%20/auth_middleware.dart';
import 'package:kta/route/route_name.dart';
import 'package:kta/view/page/event.dart';
import 'package:kta/view/page/event_detail.dart';
import 'package:kta/view/page/home.dart';
import 'package:kta/view/page/login.dart';
import 'package:kta/view/page/login_using_email.dart';
import 'package:kta/view/page/news.dart';
import 'package:kta/view/page/news_detail.dart';
import 'package:kta/view/page/otp_validate.dart';
import 'package:kta/view/page/register.dart';
import 'package:kta/view/page/register_account.dart';
import 'package:kta/view/page/scan.dart';
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
        name: Routes.loginOtp,
        page: () => LoginUsingEmailPage(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.otpValidate,
        page: () => OTPValidatePage(),
        binding: OtpBinding()),
    GetPage(
        name: Routes.register,
        page: () => RegisterPage(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.registerAccount,
        page: () => RegisterAccountPage(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.home,
        page: () => HomePage(),
        binding: HomeBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: Routes.scan, page: () => ScanPage(), binding: QRcodeBinding()),
    GetPage(name: Routes.news, page: () => NewsPage(), binding: NewsBinding()),
    GetPage(
        name: Routes.newsDetail,
        page: () => NewsDetail(),
        binding: NewsBinding()),
    GetPage(
        name: Routes.event, page: () => EventPage(), binding: EventBinding()),
    GetPage(
        name: Routes.eventDetail,
        page: () => EventDetail(),
        binding: EventBinding()),
  ];
}

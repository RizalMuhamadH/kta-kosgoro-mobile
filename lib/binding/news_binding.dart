import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kta/controller/news_controller.dart';
import 'package:kta/provider/news_provider.dart';

class NewsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(() => NewsController(NewsProvider(Dio())));
  }
}

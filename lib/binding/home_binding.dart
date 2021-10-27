import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kta/controller/home_controller.dart';
import 'package:kta/provider/elasticsearch_provider.dart';
import 'package:kta/provider/user_provider.dart';
import 'package:kta/repository/elasticsearch_repository.dart';
import 'package:kta/repository/user_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(
        UserRepository(UserProvider(Dio())),
        ElasticsearchRepository(ElasticsearchProvider(Dio()))));
  }
}

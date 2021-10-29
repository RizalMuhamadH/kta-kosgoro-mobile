import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kta/controller/qrcode_controller.dart';
import 'package:kta/provider/elasticsearch_provider.dart';
import 'package:kta/repository/elasticsearch_repository.dart';

class QRcodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QRcodeController>(() => QRcodeController(
        ElasticsearchRepository(ElasticsearchProvider(Dio()))));
  }
}

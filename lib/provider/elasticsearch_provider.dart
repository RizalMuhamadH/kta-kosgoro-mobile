import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:kta/config/constant.dart';

class ElasticsearchProvider {
  final Dio dio;

  ElasticsearchProvider(this.dio);

  Future<dynamic> getMember(String id) async {
    try {
      final res = await dio.get("$ES_URL/members/_doc/$id");
      Logger().e(res.data);
      return res.data;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}

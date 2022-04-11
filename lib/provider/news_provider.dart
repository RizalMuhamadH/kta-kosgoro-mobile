import 'package:dio/dio.dart';
import 'package:kta/config/constant.dart';
import 'package:kta/model/news.dart';
import 'package:kta/service/pref_service.dart';
import 'package:logger/logger.dart';

class NewsProvider {
  final Dio dio;

  NewsProvider(this.dio);

  Future<News> getNews() async {
    try {
      final res = await dio.post("$BASE_URL/news",
          data: FormData.fromMap({"token": PrefService.get().getToken()}));
      Logger().e(res.data);
      return News.fromJson(res.data);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}

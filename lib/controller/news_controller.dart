import 'package:get/get.dart';
import 'package:kta/model/news.dart';
import 'package:kta/provider/news_provider.dart';
import 'package:logger/logger.dart';

class NewsController extends GetxController {
  final NewsProvider provider;

  NewsController(this.provider);

  final news = <Data>[].obs;
  final data = Data().obs;

  @override
  void onInit() async {
    super.onInit();
    await getNews();
  }

  getNews() async {
    await provider.getNews().then((value) {
      if (value.code == 200) {
        news.value = value.data ?? [];
      }
    }, onError: (e) {
      Logger().e(e);
    });
  }
}

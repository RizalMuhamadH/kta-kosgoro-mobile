import 'package:dio/dio.dart';
import 'package:kta/config/constant.dart';
import 'package:kta/model/event.dart';
import 'package:kta/model/news.dart';
import 'package:kta/service/pref_service.dart';
import 'package:logger/logger.dart';

class EventProvider {
  final Dio dio;

  EventProvider(this.dio);

  Future<Event> getEvent() async {
    try {
      final res = await dio.post("$BASE_URL/event",
          data: FormData.fromMap({"token": PrefService.get().getToken()}));
      Logger().e(res.data);
      return Event.fromJson(res.data);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}

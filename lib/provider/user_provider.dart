import 'package:dio/dio.dart';
import 'package:kta/config/constant.dart';
import 'package:kta/model/complimentary.dart';
import 'package:kta/model/json_response.dart';
import 'package:kta/service/pref_service.dart';
import 'package:logger/logger.dart';

class UserProvider {
  final Dio dio;

  UserProvider(this.dio);

  Future<ResponseData> checkStatus() async {
    try {
      final res = await dio.post("$BASE_URL/check_status/member",
          data: FormData.fromMap({"email": PrefService.get().getEmail()}));
      Logger().e(res.data);
      return ResponseData.fromJson(res.data);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}

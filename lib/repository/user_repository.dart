import 'package:kta/model/complimentary.dart';
import 'package:kta/model/json_response.dart';
import 'package:kta/provider/user_provider.dart';

class UserRepository {
  final UserProvider provider;

  UserRepository(this.provider);

  Future<ResponseData> checkStatus() async => provider.checkStatus();
}

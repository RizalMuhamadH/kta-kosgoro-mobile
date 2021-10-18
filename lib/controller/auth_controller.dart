import 'package:get/get.dart';
import 'package:kta/repository/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository repository;
  AuthController(this.repository);
}

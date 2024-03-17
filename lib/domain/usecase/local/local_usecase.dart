import 'package:dbro_admin/domain/entity/auth/login.dart';

abstract class LocalUsecase {
  Future<void> clear();
  Future<void> clear_user();
  Future<void> save_user(Login login);
  Future<void> clear_secret();
  Future<void> save_secret(String secret);
  Login get get_user;
  String get get_secret;
}

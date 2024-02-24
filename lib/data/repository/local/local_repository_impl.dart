import 'package:dbro_admin/data/datasource/local_datasource.dart';
import 'package:dbro_admin/domain/entity/auth/login.dart';
import 'package:dbro_admin/data/repository/local/local_repository.dart';

class LocalRepositoryImpl extends LocalRepository {
  final LocalDatasource datasource;
  LocalRepositoryImpl(this.datasource);

  @override
  Future<void> clear() async {
    await datasource.clear();
  }

  @override
  Future<void> clear_secret() async {
    await datasource.clear_secret();
  }

  @override
  Future<void> clear_user() async {
    await datasource.clear_user();
  }

  @override
  Future<void> save_secret(String secret) async {
    await datasource.save_secret(secret);
  }

  @override
  Future<void> save_user(Login login) async {
    await datasource.save_user(login);
  }

  @override
  String get get_secret => datasource.get_secret;

  @override
  Login get get_user => datasource.get_user;
}

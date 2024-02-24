import 'package:dbro_admin/domain/entity/auth/login.dart';
import 'package:dbro_admin/data/repository/local/local_repository.dart';
import 'package:dbro_admin/domain/usecase/local_usecase/local_usecase.dart';

class LocalUsecaseImpl extends LocalUsecase {
  final LocalRepository repository;
  LocalUsecaseImpl(this.repository);

  @override
  Future<void> clear() async {
    await repository.clear();
  }

  @override
  Future<void> clear_secret() async {
    await repository.clear_secret();
  }

  @override
  Future<void> clear_user() async {
    await repository.clear_user();
  }

  @override
  Future<void> save_secret(String secret) async {
    await repository.save_secret(secret);
  }

  @override
  Future<void> save_user(Login login) async {
    await repository.save_user(login);
  }

  @override
  String get get_secret => repository.get_secret;

  @override
  Login get get_user => repository.get_user;
}

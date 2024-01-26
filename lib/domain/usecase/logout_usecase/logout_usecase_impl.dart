import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/repository/user_repository.dart';
import 'package:dbro_admin/domain/usecase/logout_usecase/logout_usecase.dart';

class LogoutUsecaseImpl extends LogoutUsecase {
  final UserRepository repository;
  LogoutUsecaseImpl(this.repository);

  @override
  Future<Either<Status, Status>> get logout {
    return repository.logout;
  }
}

import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/data/repository/user/user_repository.dart';
import 'package:dbro_admin/domain/usecase/logout/logout_usecase.dart';

class LogoutUsecaseImpl extends LogoutUsecase {
  final UserRepository repository;
  LogoutUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, StatusResponse>> get logout {
    return repository.logout;
  }
}

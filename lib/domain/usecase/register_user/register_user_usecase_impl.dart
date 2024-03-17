import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/repository/user/user_repository.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/usecase/register_user/register_user_usecase.dart';

class RegisterUserUsecaseImpl extends RegisterUserUsecase {
  final UserRepository repository;
  RegisterUserUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, StatusResponse>> register(
    Map<String, dynamic> body,
  ) {
    return repository.register(body);
  }
}

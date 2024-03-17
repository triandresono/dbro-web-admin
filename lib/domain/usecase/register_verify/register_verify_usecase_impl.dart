import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/repository/user/user_repository.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/usecase/register_verify/register_verify_usecase.dart';

class RegisterVerifyUsecaseImpl extends RegisterVerifyUsecase {
  final UserRepository repository;
  RegisterVerifyUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, StatusResponse>> registerVerify(
    Map<String, dynamic> body,
  ) {
    return repository.registerVerify(body);
  }
}

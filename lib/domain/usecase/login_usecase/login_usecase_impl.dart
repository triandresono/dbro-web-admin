import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/auth/login.dart';
import 'package:dbro_admin/data/repository/user/user_repository.dart';
import 'package:dbro_admin/domain/usecase/login_usecase/login_usecase.dart';

class LoginUsecaseImpl extends LoginUsecase {
  final UserRepository repository;
  LoginUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, Login>> login(Map<String, dynamic> body) async {
    return repository.login(body);
  }
}

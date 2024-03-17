import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/repository/user/user_repository.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/user/user_all.dart';
import 'package:dbro_admin/domain/usecase/all_user/all_user_usecase.dart';

class AllUserUsecaseImpl extends AllUserUsecase {
  final UserRepository repository;
  AllUserUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, UserAll>> userAll(
    Map<String, dynamic> parameter,
  ) {
    return repository.userAll(parameter);
  }
}

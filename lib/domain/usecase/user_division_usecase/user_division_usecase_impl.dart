import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/division/user_division.dart';
import 'package:dbro_admin/data/repository/division/division_repository.dart';
import 'package:dbro_admin/domain/usecase/user_division_usecase/user_division_usecase.dart';

class UserDivisionUsecaseImpl extends UserDivisionUsecase {
  final DivisionRepository repository;
  UserDivisionUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, UserDivision>> userDivision(String id) {
    return repository.userDivision(id);
  }
}

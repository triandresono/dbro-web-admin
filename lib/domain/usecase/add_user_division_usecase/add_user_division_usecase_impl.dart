import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/data/repository/division/division_repository.dart';
import 'package:dbro_admin/domain/usecase/add_user_division_usecase/add_user_division_usecase.dart';

class AddUserDivisionUsecaseImpl extends AddUserDivisionUsecase {
  final DivisionRepository repository;
  AddUserDivisionUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, GetId>> addUserDivision(
      Map<String, dynamic> body) {
    return repository.addUserDivision(body);
  }
}

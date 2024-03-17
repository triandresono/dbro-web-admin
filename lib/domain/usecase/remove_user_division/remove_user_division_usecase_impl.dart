import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/repository/division/division_repository.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/usecase/remove_user_division/remove_user_division_usecase.dart';

class RemoveUserDivisionUsecaseImpl extends RemoveUserDivisionUsecase {
  final DivisionRepository repository;
  RemoveUserDivisionUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, StatusResponse>> removeUserDivision(
    Map<String, dynamic> body,
  ) {
    return repository.removeUserDivision(body);
  }
}

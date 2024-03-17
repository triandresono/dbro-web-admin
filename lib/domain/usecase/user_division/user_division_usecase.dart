import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/division/user_division.dart';

abstract class UserDivisionUsecase {
  Future<Either<StatusResponse, UserDivision>> userDivision(String id);
}

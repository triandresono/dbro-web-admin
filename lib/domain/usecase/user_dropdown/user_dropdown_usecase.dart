import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/user/user_dropdown.dart';

abstract class UserDropdownUsecase {
  Future<Either<StatusResponse, UserDropdown>> get userDropdown;
}

import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/user/user_dropdown.dart';

abstract class UserDropdownUsecase {
  Future<Either<Status, UserDropdown>> get userDropdown;
}

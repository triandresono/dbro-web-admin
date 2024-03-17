import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/sysconfig/role_dropdown.dart';

abstract class RoleDropdownUsecase {
  Future<Either<StatusResponse, RoleDropdown>> get roleDropdown;
}

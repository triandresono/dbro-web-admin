import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/repository/sysconfig/sysconfig_repository.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/sysconfig/role_dropdown.dart';
import 'package:dbro_admin/domain/usecase/role_dropdown/role_dropdown_usecase.dart';

class RoleDropdownUsecaseImpl extends RoleDropdownUsecase {
  final SysconfigRepository repository;
  RoleDropdownUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, RoleDropdown>> get roleDropdown {
    return repository.roleDropdown;
  }
}

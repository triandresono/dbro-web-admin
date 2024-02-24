import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/permission/my_permission.dart';
import 'package:dbro_admin/data/repository/permission/permission_repository.dart';
import 'package:dbro_admin/domain/usecase/my_permission_usecase/my_permission_usecase.dart';

class MyPermissionUsecaseImpl extends MyPermissionUsecase {
  final PermissionRepository repository;
  MyPermissionUsecaseImpl(this.repository);
  @override
  Future<Either<StatusResponse, MyPermission>> get my_permission {
    return repository.my_permission;
  }
}

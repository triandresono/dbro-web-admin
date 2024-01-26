import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/permission/my_permission.dart';
import 'package:dbro_admin/domain/repository/permission_repository.dart';
import 'package:dbro_admin/domain/usecase/my_permission_usecase/my_permission_usecase.dart';

class MyPermissionUsecaseImpl extends MyPermissionUsecase {
  final PermissionRepository repository;
  MyPermissionUsecaseImpl(this.repository);
  @override
  Future<Either<Status, MyPermission>> get my_permission {
    return repository.my_permission;
  }
}

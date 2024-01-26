import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/permission/permission_list.dart';
import 'package:dbro_admin/domain/repository/permission_repository.dart';
import 'package:dbro_admin/domain/usecase/permission_list_usecase/permission_list_usecase.dart';

class PermissionListUsecaseImpl extends PermissionListUsecase {
  final PermissionRepository repository;
  PermissionListUsecaseImpl(this.repository);

  @override
  Future<Either<Status, PermissionList>> permission_list(
    Map<String, dynamic> map,
  ) {
    return repository.permission_list(map);
  }
}

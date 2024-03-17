import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/data/repository/permission/permission_repository.dart';
import 'package:dbro_admin/domain/usecase/permission_delete/permission_delete_usecase.dart';

class PermissionDeleteUsecaseImpl extends PermissionDeleteUsecase {
  final PermissionRepository repository;
  PermissionDeleteUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, GetId>> permission_delete(
      Map<String, dynamic> body) {
    return repository.permission_delete(body);
  }
}

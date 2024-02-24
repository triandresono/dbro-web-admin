import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/data/repository/permission/permission_repository.dart';
import 'package:dbro_admin/domain/usecase/permission_create_usecase/permission_create_usecase.dart';

class PermissionCreateUsecaseImpl extends PermissionCreateUsecase {
  final PermissionRepository repository;
  PermissionCreateUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, GetId>> permission_create(
      Map<String, dynamic> body) {
    return repository.permission_create(body);
  }
}

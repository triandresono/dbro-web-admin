import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/entity/permission/my_permission.dart';
import 'package:dbro_admin/domain/entity/permission/permission_list.dart';

abstract class PermissionRepository {
  Future<Either<StatusResponse, GetId>> permission_create(
      Map<String, dynamic> body);

  Future<Either<StatusResponse, GetId>> permission_delete(
      Map<String, dynamic> body);

  Future<Either<StatusResponse, MyPermission>> get my_permission;

  Future<Either<StatusResponse, PermissionList>> permission_list(
    Map<String, dynamic> map,
  );
}

import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/entity/permission/my_permission.dart';
import 'package:dbro_admin/domain/entity/permission/permission_list.dart';

abstract class PermissionRepository {
  Future<Either<Status, GetId>> permission_create(Map<String, dynamic> body);

  Future<Either<Status, GetId>> permission_delete(Map<String, dynamic> body);

  Future<Either<Status, MyPermission>> get my_permission;

  Future<Either<Status, PermissionList>> permission_list(
    Map<String, dynamic> map,
  );
}

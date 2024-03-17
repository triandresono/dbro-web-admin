import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/permission/my_permission.dart';

abstract class MyPermissionUsecase {
  Future<Either<StatusResponse, MyPermission>> get my_permission;
}

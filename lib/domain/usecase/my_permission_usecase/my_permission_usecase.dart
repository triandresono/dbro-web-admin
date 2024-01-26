import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/permission/my_permission.dart';

abstract class MyPermissionUsecase {
  Future<Either<Status, MyPermission>> get my_permission;
}

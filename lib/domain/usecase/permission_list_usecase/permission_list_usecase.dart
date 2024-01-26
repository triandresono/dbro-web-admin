import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/permission/permission_list.dart';

abstract class PermissionListUsecase {
  Future<Either<Status, PermissionList>> permission_list(
    Map<String, dynamic> map,
  );
}

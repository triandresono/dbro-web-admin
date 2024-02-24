import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/permission/permission_list.dart';

abstract class PermissionListUsecase {
  Future<Either<StatusResponse, PermissionList>> permission_list(
    Map<String, dynamic> map,
  );
}

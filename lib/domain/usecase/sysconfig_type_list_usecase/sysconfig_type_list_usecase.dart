import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_type_list.dart';

abstract class SysconfigTypeListUsecase {
  Future<Either<StatusResponse, SysconfigTypeList>> get list;
}

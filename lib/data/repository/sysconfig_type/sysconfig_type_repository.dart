import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_detail.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_type_list.dart';

abstract class SysconfigTypeRepository {
  Future<Either<StatusResponse, SysconfigDetail>> getDetail(String name);

  Future<Either<StatusResponse, SysconfigTypeList>> get list;
}

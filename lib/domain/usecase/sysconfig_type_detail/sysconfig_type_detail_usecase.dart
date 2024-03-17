import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_detail.dart';

abstract class SysconfigTypeDetailUsecase {
  Future<Either<StatusResponse, SysconfigDetail>> getDetail(String name);
}

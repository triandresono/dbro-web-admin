import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_list.dart';

abstract class SysconfigListUsecase {
  Future<Either<StatusResponse, SysconfigList>> sysconfig_list(
    Map<String, dynamic> map,
  );
}

import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_list.dart';

abstract class SysconfigRepository {
  Future<Either<StatusResponse, SysconfigList>> sysconfig_list(
    Map<String, dynamic> map,
  );
  Future<Either<StatusResponse, GetId>> create(Map<String, dynamic> body);
}

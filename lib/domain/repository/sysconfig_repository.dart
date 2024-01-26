import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_list.dart';

abstract class SysconfigRepository {
  Future<Either<Status, SysconfigList>> sysconfig_list(
    Map<String, dynamic> map,
  );
  Future<Either<Status, GetId>> create(Map<String, dynamic> body);
}

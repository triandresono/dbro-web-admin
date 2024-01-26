import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_list.dart';

abstract class SysconfigListUsecase {
  Future<Either<Status, SysconfigList>> sysconfig_list(
    Map<String, dynamic> map,
  );
}

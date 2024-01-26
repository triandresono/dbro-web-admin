import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_detail.dart';

abstract class SysconfigTypeDetailUsecase {
  Future<Either<Status, SysconfigDetail>> getDetail(String name);
}

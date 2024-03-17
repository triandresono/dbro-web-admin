import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_detail.dart';
import 'package:dbro_admin/data/repository/sysconfig_type/sysconfig_type_repository.dart';
import 'sysconfig_type_detail_usecase.dart';

class SysconfigTypeDetailUsecaseImpl extends SysconfigTypeDetailUsecase {
  final SysconfigTypeRepository repository;
  SysconfigTypeDetailUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, SysconfigDetail>> getDetail(String name) {
    return repository.getDetail(name);
  }
}

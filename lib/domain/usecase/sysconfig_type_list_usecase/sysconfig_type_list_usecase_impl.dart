import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_type_list.dart';
import 'package:dbro_admin/domain/repository/sysconfig_type_repository.dart';
import 'package:dbro_admin/domain/usecase/sysconfig_type_list_usecase/sysconfig_type_list_usecase.dart';

class SysconfigTypeListUsecaseImpl extends SysconfigTypeListUsecase {
  final SysconfigTypeRepository repository;
  SysconfigTypeListUsecaseImpl(this.repository);
  @override
  Future<Either<Status, SysconfigTypeList>> get list {
    return repository.list;
  }
}

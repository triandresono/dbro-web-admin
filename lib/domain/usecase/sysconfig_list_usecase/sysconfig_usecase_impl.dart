import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_list.dart';
import 'package:dbro_admin/domain/repository/sysconfig_repository.dart';
import 'package:dbro_admin/domain/usecase/sysconfig_list_usecase/sysconfog_list_usecase.dart';

class SysconfigListUsecaseImpl extends SysconfigListUsecase {
  final SysconfigRepository repository;
  SysconfigListUsecaseImpl(this.repository);

  @override
  Future<Either<Status, SysconfigList>> sysconfig_list(
    Map<String, dynamic> map,
  ) {
    return repository.sysconfig_list(map);
  }
}

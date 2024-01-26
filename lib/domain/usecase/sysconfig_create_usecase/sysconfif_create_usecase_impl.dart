import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/repository/sysconfig_repository.dart';
import 'sysconfig_create_usecase.dart';

class SysconfigCreateUsecaseImpl extends SysconfigCreateUsecase {
  final SysconfigRepository repository;
  SysconfigCreateUsecaseImpl(this.repository);

  @override
  Future<Either<Status, GetId>> create(Map<String, dynamic> body) async {
    return repository.create(body);
  }
}

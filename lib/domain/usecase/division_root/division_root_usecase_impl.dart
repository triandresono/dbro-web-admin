import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/division/division_list.dart';
import 'package:dbro_admin/data/repository/division/division_repository.dart';
import 'division_root_usecase.dart';

class DivisionRootUsecaseImpl extends DivisionRootUsecase {
  final DivisionRepository repository;
  DivisionRootUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, DivisionList>> get rootList {
    return repository.rootList;
  }
}

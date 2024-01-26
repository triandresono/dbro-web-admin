import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/division/division_list.dart';
import 'package:dbro_admin/domain/repository/division_repository.dart';
import 'division_root_usecase.dart';

class DivisionRootUsecaseImpl extends DivisionRootUsecase {
  final DivisionRepository repository;
  DivisionRootUsecaseImpl(this.repository);

  @override
  Future<Either<Status, DivisionList>> get rootList {
    return repository.rootList;
  }
}

import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/division/division_list.dart';
import 'package:dbro_admin/domain/repository/division_repository.dart';
import 'package:dbro_admin/domain/usecase/division_child_usecase/division_child_usecase_impl.dart';

class DivisionChildUsecaseImpl extends DivisionChildUsecase {
  final DivisionRepository repository;
  DivisionChildUsecaseImpl(this.repository);

  @override
  Future<Either<Status, DivisionList>> childList(String id) {
    return repository.childList(id);
  }
}

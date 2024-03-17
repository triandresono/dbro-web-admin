import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/division/division_list.dart';
import 'package:dbro_admin/data/repository/division/division_repository.dart';
import 'package:dbro_admin/domain/usecase/division_child/division_child_usecase_impl.dart';

class DivisionChildUsecaseImpl extends DivisionChildUsecase {
  final DivisionRepository repository;
  DivisionChildUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, DivisionList>> childList(String id) {
    return repository.childList(id);
  }
}

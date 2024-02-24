import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/data/repository/division/division_repository.dart';
import 'package:dbro_admin/domain/usecase/division_create_relation_usecase/division_create_relation_usecase.dart';

class DivisionCreateRelationUsecaseImpl extends DivisionCreateRelationUsecase {
  final DivisionRepository repository;
  DivisionCreateRelationUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, GetId>> createDivisionStructure(
    Map<String, dynamic> body,
  ) {
    return repository.createDivisionStructure(body);
  }
}

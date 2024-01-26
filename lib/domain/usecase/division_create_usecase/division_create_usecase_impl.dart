import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/repository/division_repository.dart';
import 'package:dbro_admin/domain/usecase/division_create_usecase/division_create_usecase.dart';

class DivisionCreateUsecaseImpl extends DivisionCreateUsecase {
  final DivisionRepository repository;
  DivisionCreateUsecaseImpl(this.repository);

  @override
  Future<Either<Status, GetId>> createDivision(Map<String, dynamic> body) {
    return repository.createDivision(body);
  }
}

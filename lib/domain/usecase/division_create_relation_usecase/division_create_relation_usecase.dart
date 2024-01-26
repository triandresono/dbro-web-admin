import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';

abstract class DivisionCreateRelationUsecase {
  Future<Either<Status, GetId>> createDivisionStructure(
    Map<String, dynamic> body,
  );
}

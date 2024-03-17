import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';

abstract class DivisionCreateUsecase {
  Future<Either<StatusResponse, GetId>> createDivision(
      Map<String, dynamic> body);
}

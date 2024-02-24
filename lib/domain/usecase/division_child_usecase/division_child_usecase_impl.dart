import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/division/division_list.dart';

abstract class DivisionChildUsecase {
  Future<Either<StatusResponse, DivisionList>> childList(String id);
}

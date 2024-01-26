import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/division/division_list.dart';

abstract class DivisionRootUsecase {
  Future<Either<Status, DivisionList>> get rootList;
}

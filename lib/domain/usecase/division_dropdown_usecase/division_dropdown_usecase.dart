import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/division/division_dropdown.dart';

abstract class DivisionDropdownUsecase {
  Future<Either<StatusResponse, DivisionDropdown>> get dropdown;
}

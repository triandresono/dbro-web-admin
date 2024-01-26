import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/division/division_dropdown.dart';

abstract class DivisionDropdownUsecase {
  Future<Either<Status, DivisionDropdown>> get dropdown;
}

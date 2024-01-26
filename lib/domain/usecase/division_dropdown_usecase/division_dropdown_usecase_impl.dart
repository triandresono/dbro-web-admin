import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/division/division_dropdown.dart';
import 'package:dbro_admin/domain/repository/division_repository.dart';
import 'package:dbro_admin/domain/usecase/division_dropdown_usecase/division_dropdown_usecase.dart';

class DivisionDropdownUsecaseImpl extends DivisionDropdownUsecase {
  final DivisionRepository repository;
  DivisionDropdownUsecaseImpl(this.repository);

  @override
  Future<Either<Status, DivisionDropdown>> get dropdown {
    return repository.dropdown;
  }
}

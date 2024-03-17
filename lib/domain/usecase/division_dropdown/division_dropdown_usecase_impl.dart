import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/division/division_dropdown.dart';
import 'package:dbro_admin/data/repository/division/division_repository.dart';
import 'package:dbro_admin/domain/usecase/division_dropdown/division_dropdown_usecase.dart';

class DivisionDropdownUsecaseImpl extends DivisionDropdownUsecase {
  final DivisionRepository repository;
  DivisionDropdownUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, DivisionDropdown>> get dropdown {
    return repository.dropdown;
  }
}

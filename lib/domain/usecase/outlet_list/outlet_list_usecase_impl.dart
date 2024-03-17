import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/repository/division/division_repository.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/division/outlet_payroll_list.dart';
import 'package:dbro_admin/domain/usecase/outlet_list/outlet_list_usecase.dart';

class OutletListUsecaseImpl extends OutletListUsecase {
  final DivisionRepository repository;
  OutletListUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, OutletPayrollList>> get outletList {
    return repository.outletList;
  }
}

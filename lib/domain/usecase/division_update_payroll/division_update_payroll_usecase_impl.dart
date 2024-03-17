import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/repository/division/division_repository.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/usecase/division_update_payroll/division_update_payroll_usecase.dart';

class DivisionUpdatePayrollUsecaseImpl extends DivisionUpdatePayrollUsecase {
  final DivisionRepository repository;
  DivisionUpdatePayrollUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, StatusResponse>> updateDivisionPayroll(
    Map<String, dynamic> body,
  ) {
    return repository.updateDivisionPayroll(body);
  }
}

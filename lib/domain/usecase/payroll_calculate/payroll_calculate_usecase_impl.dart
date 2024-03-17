import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/repository/payroll/payroll_repository.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/usecase/payroll_calculate/payroll_calculate_usecase.dart';

class PayrollCalculateUsecaseImpl extends PayrollCalculateUsecase {
  final PayrollRepository repository;
  PayrollCalculateUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, dynamic>> calculatePayroll(
    Map<String, dynamic> parameter,
  ) {
    return repository.calculatePayroll(parameter);
  }
}

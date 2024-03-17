import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/repository/payroll/payroll_repository.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/payroll/payroll_user_list.dart';
import 'package:dbro_admin/domain/usecase/payroll_user/payroll_user_usecase.dart';

class PayrollUserUsecaseImpl extends PayrollUserUsecase {
  final PayrollRepository repository;
  PayrollUserUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, PayrollUserList>> payrollUser(String id) {
    return repository.payrollUser(id);
  }
}

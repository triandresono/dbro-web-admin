import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/repository/user/user_repository.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/usecase/user_update_payroll/user_update_payroll_usecase.dart';

class UserUpdatePayrollUsecaseImpl extends UserUpdatePayrollUsecase {
  final UserRepository repository;
  UserUpdatePayrollUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, GetId>> updatePayroll(
    Map<String, dynamic> body,
  ) {
    return repository.updatePayroll(body);
  }
}

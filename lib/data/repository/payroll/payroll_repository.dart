import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/payroll/payroll_user_list.dart';

abstract class PayrollRepository {
  Future<Either<StatusResponse, PayrollUserList>> payrollUser(
    String id,
  );
}

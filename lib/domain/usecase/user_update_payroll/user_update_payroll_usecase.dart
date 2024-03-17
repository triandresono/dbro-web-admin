import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';

abstract class UserUpdatePayrollUsecase {
  Future<Either<StatusResponse, GetId>> updatePayroll(
    Map<String, dynamic> body,
  );
}

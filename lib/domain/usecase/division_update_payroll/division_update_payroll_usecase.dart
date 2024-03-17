import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';

abstract class DivisionUpdatePayrollUsecase {
  Future<Either<StatusResponse, StatusResponse>> updateDivisionPayroll(
    Map<String, dynamic> body,
  );
}

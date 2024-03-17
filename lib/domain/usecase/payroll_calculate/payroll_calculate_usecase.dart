import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';

abstract class PayrollCalculateUsecase {
  Future<Either<StatusResponse, dynamic>> calculatePayroll(
    Map<String, dynamic> parameter,
  );
}

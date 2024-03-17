import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';

abstract class LogoutUsecase {
  Future<Either<StatusResponse, StatusResponse>> get logout;
}

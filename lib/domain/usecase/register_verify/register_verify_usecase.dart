import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';

abstract class RegisterVerifyUsecase {
  Future<Either<StatusResponse, StatusResponse>> registerVerify(
    Map<String, dynamic> body,
  );
}

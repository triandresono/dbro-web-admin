import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';

abstract class RegisterUserUsecase {
  Future<Either<StatusResponse, StatusResponse>> register(
    Map<String, dynamic> body,
  );
}

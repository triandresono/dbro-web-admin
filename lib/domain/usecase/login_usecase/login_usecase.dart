import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/auth/login.dart';

abstract class LoginUsecase {
  Future<Either<StatusResponse, Login>> login(Map<String, dynamic> body);
}

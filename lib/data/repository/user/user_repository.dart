import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/auth/login.dart';
import 'package:dbro_admin/domain/entity/user/user_dropdown.dart';

abstract class UserRepository {
  Future<Either<StatusResponse, Login>> login(Map<String, dynamic> body);

  Future<Either<StatusResponse, StatusResponse>> get logout;

  Future<Either<StatusResponse, UserDropdown>> get userDropdown;
}

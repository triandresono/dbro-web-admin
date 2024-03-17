import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/entity/auth/login.dart';
import 'package:dbro_admin/domain/entity/user/user_all.dart';
import 'package:dbro_admin/domain/entity/user/user_attendance.dart';
import 'package:dbro_admin/domain/entity/user/user_dropdown.dart';

abstract class UserRepository {
  Future<Either<StatusResponse, Login>> login(Map<String, dynamic> body);

  Future<Either<StatusResponse, StatusResponse>> get logout;

  Future<Either<StatusResponse, UserDropdown>> get userDropdown;

  Future<Either<StatusResponse, UserAttendance>> get userAttendance;

  Future<Either<StatusResponse, UserAll>> userAll(
    Map<String, dynamic> parameter,
  );

  Future<Either<StatusResponse, StatusResponse>> register(
    Map<String, dynamic> body,
  );

  Future<Either<StatusResponse, StatusResponse>> registerVerify(
    Map<String, dynamic> body,
  );

  Future<Either<StatusResponse, GetId>> updatePayroll(
    Map<String, dynamic> body,
  );
}

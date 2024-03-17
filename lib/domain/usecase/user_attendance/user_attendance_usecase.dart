import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/user/user_attendance.dart';

abstract class UserAttendanceUsecase {
  Future<Either<StatusResponse, UserAttendance>> get userAttendance;
}

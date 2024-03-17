import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/repository/user/user_repository.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/user/user_attendance.dart';
import 'package:dbro_admin/domain/usecase/user_attendance/user_attendance_usecase.dart';

class UserAttendanceUsecaseImpl extends UserAttendanceUsecase {
  final UserRepository repository;
  UserAttendanceUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, UserAttendance>> get userAttendance {
    return repository.userAttendance;
  }
}

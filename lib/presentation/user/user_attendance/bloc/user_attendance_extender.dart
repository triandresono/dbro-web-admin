import 'package:dbro_admin/domain/entity/user/user_attendance.dart';
import 'package:dbro_admin/domain/usecase/user_attendance/user_attendance_usecase.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:dbro_admin/utils/constants/consts.dart';
import 'package:get/get.dart';

part 'user_attendance_bloc.dart';

mixin class _Extender {
  final listCase = Case<UserAttendance>().obs;
}

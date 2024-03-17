part of 'user_attendance_extender.dart';

class UserAttendanceBloc extends GetxController with _Extender {
  final UserAttendanceUsecase attendanceUsecase;
  UserAttendanceBloc({required this.attendanceUsecase});

  @override
  void onInit() {
    (this).fetchAttendance();
    super.onInit();
  }

  void fetchAttendance() async {
    listCase(LoadingCase());
    final response = await attendanceUsecase.userAttendance;
    response.fold(
      (failure) {
        if (failure.code.equal(Consts.any.unauthorized)) {
          listCase(UnauthorizedCase());
        } else {
          listCase(ErrorCase(failure));
        }
      },
      (result) {
        listCase(LoadedCase(result));
      },
    );
  }
}

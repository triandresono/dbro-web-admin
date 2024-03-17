part of 'user_attendance_worker.dart';

@RoutePage()
class UserAttendancePage extends StatelessWidget {
  static const path = 'user_attendance';
  const UserAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Util.drawer(context),
      backgroundColor: AppColor.appGrayBg,
      appBar: BaseAppbar(
        title: 'User Attendance',
        menu: [
          Bar(
            title: 'Manage User Attendance',
            color: AppColor.projectPrimary,
          ),
        ],
      ),
      body: GetBuilder<UserAttendanceBloc>(
        init: UserAttendanceBloc(
          attendanceUsecase: Get.find(),
        ),
        builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: _Body(),
          );
        },
      ),
    );
  }
}

class _Body extends GetState<UserAttendanceBloc> with _Worker {
  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<UserAttendanceBloc>(
      init: bloc,
      container: this,
      context: context,
      builder: (controller) {
        return AnimatedColumn(
          children: [
            const SizedBox(height: 24),
            NoPermissionPage(
              cases: [controller.listCase],
              height: Sizer.fix_height * 0.3,
              child: Obx(() {
                final state = bloc.listCase.value;
                final list = state.data ?? UserAttendance.dummy();
                return Skeletonizer(
                  enabled: state is LoadingCase,
                  child: Skeleton.leaf(
                    child: EmptyState(
                      emptyCondition: list.userAttendanceListingDTOs.isEmpty,
                      child: _Table(
                        list: list.userAttendanceListingDTOs,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}

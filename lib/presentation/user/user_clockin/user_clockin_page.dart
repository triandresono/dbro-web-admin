part of 'user_clockin_worker.dart';

@RoutePage()
class UserClockinPage extends StatelessWidget {
  static const path = 'user/user_clockin';
  const UserClockinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Util.drawer(context),
      backgroundColor: AppColor.appGrayBg,
      appBar: BaseAppbar(
        title: 'Clock in',
        menu: [
          Bar(
            title: 'Manage User',
            color: AppColor.projectPrimary,
            onTap: () => AppRouter.nav.replace(
              const UserListRoute(),
            ),
          ),
          Bar(
            title: 'View Clock in',
            color: AppColor.projectPrimary,
          ),
        ],
      ),
      body: GetBuilder<UserClockinBloc>(
        init: UserClockinBloc(
          usecase: Get.find(),
          argument: UserClockinArgument(
            id: Util.rawParameter['id'] ?? '',
          ),
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

class _Body extends GetState<UserClockinBloc> with _Worker {
  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(worker);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<UserClockinBloc>(
      init: bloc,
      container: this,
      context: context,
      builder: (controller) {
        return AnimatedColumn(
          children: [
            const SizedBox(height: 24),
            NoPermissionPage(
              cases: [controller.userCase],
              height: Sizer.fix_height * 0.3,
              child: Obx(() {
                final state = bloc.userCase.value;
                final list = state.data ?? ClockInUserList.dummy();
                return Skeletonizer(
                  enabled: state is LoadingCase,
                  child: Skeleton.leaf(
                    child: EmptyState(
                      emptyCondition: list.userClockInDataDTOs.isEmpty,
                      child: _Table(
                        isLoading: state is LoadingCase,
                        list: list.userClockInDataDTOs,
                        bloc: bloc,
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

part of 'division_user_list_worker.dart';

@RoutePage()
class DivisionUserListPage extends StatelessWidget {
  static const path = 'division/user_division';
  const DivisionUserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NoParameterPage(
      paramLength: 1,
      child: Scaffold(
        drawer: Util.drawer(context),
        backgroundColor: AppColor.appGrayBg,
        appBar: BaseAppbar(
          title: 'User Division',
          menu: [
            Bar(
              title: 'Manage Division',
              color: AppColor.projectPrimary,
              onTap: () => AppRouter.nav.replace(
                const DivisionListRoute(),
              ),
            ),
            Bar(
              title: 'Manage User Division',
              color: AppColor.projectPrimary,
            ),
          ],
        ),
        body: GetBuilder(
          init: DivisionUserListBloc(
            userDivisionUsecase: Get.find(),
            removeUsecase: Get.find(),
            argument: DivisionUserListArgument.fromMap(Util.rawParameter),
          ),
          builder: (controller) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: _Body(),
            );
          },
        ),
      ),
    );
  }
}

class _Body extends GetState<DivisionUserListBloc> with _Worker {
  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(worker);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder(
      init: bloc,
      container: this,
      context: context,
      builder: (controller) {
        return AnimatedColumn(
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                BaseButtonIcon(
                  title: "Add User Division",
                  icon: Icons.add,
                  onPressed: () async {
                    AppRouter.nav
                        .dialog(
                          dialog: DivisionUserAddDialog(
                            argument: DivisionUserAddArgument(
                              divisionId: bloc.argument.divisionId,
                            ),
                          ),
                        )
                        .then((_) => bloc.getUserDivision());
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            NoPermissionPage(
              cases: [controller.userCase],
              height: Sizer.fix_height * 0.3,
              child: Obx(() {
                final state = bloc.userCase.value;
                final data = bloc.isInit.isFalse
                    ? UserDivision.dummy().divisionUserListingDTOs
                    : state.data?.divisionUserListingDTOs ??
                        UserDivision.dummy().divisionUserListingDTOs;
                return _Table(
                  isLoading: state is LoadingCase,
                  list: data,
                  bloc: bloc,
                );
              }),
            ),
          ],
        );
      },
    );
  }
}

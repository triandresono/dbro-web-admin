part of 'outlet_user_list_worker.dart';

@RoutePage()
class OutletuserListPage extends StatelessWidget {
  static const path = 'payroll/outlet_user';
  const OutletuserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Util.drawer(context),
      backgroundColor: AppColor.appGrayBg,
      appBar: BaseAppbar(
        title: 'Outlet',
        menu: [
          Bar(
            title: 'Manage Outlet',
            color: AppColor.projectPrimary,
            onTap: () => AppRouter.nav.replace(
              const OutletListRoute(),
            ),
          ),
          Bar(
            title: 'Manage Outlet User',
            color: AppColor.projectPrimary,
          ),
        ],
      ),
      body: GetBuilder<OutletUserListBloc>(
        init: OutletUserListBloc(
          payrollUserUsecase: Get.find(),
          argument: PayrollUserListArgument(
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

class _Body extends GetState<OutletUserListBloc> with _Worker {
  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(worker);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<OutletUserListBloc>(
      init: bloc,
      container: this,
      context: context,
      builder: (controller) {
        return AnimatedColumn(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                BaseButtonIcon(
                  title: "Calculate Payroll",
                  icon: IconlyLight.filter,
                  onPressed: () async {
                    AppRouter.nav.dialog(
                      dialog: OutletPayrollCalculateDialog(
                        argument: OutletPayrollCalculateArgument(
                          divisionId: bloc.argument.id,
                        ),
                      ),
                    );
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
                final list = state.data ?? PayrollUserList.dummy();
                return Skeletonizer(
                  enabled: state is LoadingCase,
                  child: Skeleton.leaf(
                    child: EmptyState(
                      emptyCondition:
                          list.divisionUserPayrollListingDTOs.isEmpty,
                      child: _Table(
                        isLoading: state is LoadingCase,
                        list: list.divisionUserPayrollListingDTOs,
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

part of 'outlet_list_worker.dart';

@RoutePage()
class OutletListPage extends StatelessWidget {
  static const path = 'payroll';
  const OutletListPage({super.key});

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
          ),
        ],
      ),
      body: GetBuilder<OutletListBloc>(
        init: OutletListBloc(
          outletListUsecase: Get.find(),
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

class _Body extends GetState<OutletListBloc> with _Worker {
  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<OutletListBloc>(
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
                final list = state.data ?? OutletPayrollList.dummy();
                return Skeletonizer(
                  enabled: state is LoadingCase,
                  child: Skeleton.leaf(
                    child: EmptyState(
                      emptyCondition: list.divisionPayrollListingDTOs.isEmpty,
                      child: _Table(
                        list: list.divisionPayrollListingDTOs,
                        onRefresh: () => bloc.getOutletList(),
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

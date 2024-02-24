part of 'sysconfig_list_worker.dart';

@RoutePage()
class SysconfigListPage extends StatelessWidget {
  static const path = 'parameter/sysconfig_list';
  const SysconfigListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NoParameterPage(
      paramLength: 2,
      child: Scaffold(
        drawer: Util.drawer(context),
        backgroundColor: AppColor.appGrayBg,
        appBar: BaseAppbar(
          title: 'Parameter',
          menu: [
            Bar(
              title: 'Manage System Type',
              color: AppColor.projectPrimary,
              onTap: () => AppRouter.nav.replace(const SysconfigTypeRoute()),
            ),
            Bar(
              title: 'Manage System Config',
              color: AppColor.projectPrimary,
            ),
          ],
        ),
        body: GetBuilder(
          init: SysconfigListBloc(
            listUsecase: Get.find(),
            argument: SysconfigListArgument.fromMap(Util.rawParameter),
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

class _Body extends GetState<SysconfigListBloc> with _Worker {
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
                  title: "Add Config",
                  icon: Icons.add,
                  onPressed: () async {
                    final result = await AppRouter.nav.dialog(
                      dialog: AddSysconfigDialog(
                        argument: bloc.argument,
                      ),
                    );
                    if (result != null) {
                      bloc.sysconfigList();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            NoPermissionPage(
              cases: [controller.listState],
              height: Sizer.fix_height * 0.3,
              child: Obx(() {
                final state = bloc.listState.value;
                final data = bloc.isInit.isFalse
                    ? SysconfigList.dummy().dtos
                    : bloc.sysList;
                return _Table(
                  isLoading: state is LoadingCase,
                  list: data,
                  bloc: bloc,
                );
              }),
            ),
            const SizedBox(height: 24),
            Obx(() {
              final size = bloc.request.size.toInt();
              if (bloc.isInit.isFalse) {
                return const SizedBox.shrink();
              } else {
                final count = bloc.totalCount.value;
                final total = (count / size).ceil();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Card(
                      elevation: 8.0,
                      shadowColor: Colors.grey.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: WebPagination(
                          onPageChanged: (page) {
                            bloc.request.page = page - 1;
                            bloc.sysconfigList();
                          },
                          currentPage: bloc.request.page.toInt() + 1,
                          displayItemCount: size,
                          totalPage: total,
                        ),
                      ),
                    ),
                  ],
                );
              }
            }),
          ],
        );
      },
    );
  }
}

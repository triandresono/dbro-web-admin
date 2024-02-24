part of 'role_worker.dart';

@RoutePage()
class RolePage extends StatelessWidget {
  static const path = 'role';
  const RolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Util.drawer(context),
      backgroundColor: AppColor.appGrayBg,
      appBar: BaseAppbar(
        title: 'Role',
        menu: [
          Bar(
            title: 'Manage Role',
            color: AppColor.projectPrimary,
          ),
        ],
      ),
      body: GetBuilder(
        init: RoleBloc(Get.find()),
        builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: _RoleGetBody(),
          );
        },
      ),
    );
  }
}

class _RoleGetBody extends GetState<RoleBloc> with _Worker {
  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(workers);
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
                  title: "Add Role",
                  icon: Icons.add,
                  onPressed: () async {
                    final result = await AppRouter.nav.dialog(
                      dialog: const AddRoleDialog(),
                    );
                    if (result != null) {
                      bloc.sysconfig();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            NoPermissionPage(
              cases: [controller.roleState],
              height: Sizer.fix_height * 0.3,
              child: Obx(() {
                final state = bloc.roleState.value;
                final data = bloc.isInit.isFalse
                    ? SysconfigList.dummy().dtos
                    : bloc.roles;
                return _Table(
                  isLoading: state is LoadingCase,
                  list: data,
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
                            bloc.sysconfig();
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

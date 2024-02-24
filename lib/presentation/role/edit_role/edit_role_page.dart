part of 'edit_role_worker.dart';

@RoutePage()
class EditRolePage extends StatelessWidget {
  static const path = 'role/edit_role';
  const EditRolePage({super.key});

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
            onTap: () => AppRouter.nav.replace(const RoleRoute()),
          ),
          Bar(
            title: 'Edit Role',
            color: AppColor.projectPrimary,
          ),
        ],
      ),
      body: GetBuilder(
        init: EditRoleBloc(
          myPermissionUsecase: Get.find(),
          permissionListUsecase: Get.find(),
          sysconfigListUsecase: Get.find(),
          permissionCreateUsecase: Get.find(),
          permissionDeleteUsecase: Get.find(),
          argument: EditRoleArgument.fromMap(Util.rawParameter),
        ),
        builder: (controller) {
          return NoPermissionPage(
            cases: [controller.roleState, controller.completeState],
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ).copyWith(bottom: 34),
              child: _StatelessBody(),
            ),
          );
        },
      ),
    );
  }
}

class _StatelessBody extends GetState<EditRoleBloc> with _Worker {
  @override
  Widget build(BuildContext context) {
    return GetStateBuilder(
      init: bloc,
      container: this,
      context: context,
      builder: (controller) {
        return BaseContainer(
          child: AnimatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit Role',
                style: Font.fix(18).bold(
                  color: AppColor.headerTile,
                ),
              ),
              const SizedBox(height: 20),
              // Obx(() {
              //   final data = bloc.paramState.value;
              //   return Skeletonizer(
              //     enabled: data is LoadingCase,
              //     child: Skeleton.leaf(
              //       child: BaseField(
              //         readOnly: true,
              //         controller: TextEditingController()
              //           ..text = bloc.argument.role,
              //         hint: 'Role',
              //       ),
              //     ),
              //   );
              // }),
              Obx(() {
                final data = bloc.paramState.value;
                return Skeletonizer(
                  enabled: data is LoadingCase,
                  child: Skeleton.leaf(
                    child: PrefixBaseInput(
                      controller: TextEditingController()
                        ..text = bloc.argument.role,
                      fillColor: Colors.white,
                      labelBgColor: Colors.white,
                      enable: false,
                      hint: "Selected Role",
                      leading: (p0) {
                        return FieldIconSuffix(
                          padding: const EdgeInsets.only(left: 16),
                          icon: Icon(
                            IconlyLight.setting,
                            color: p0,
                            size: 17,
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
              const SizedBox(height: 34),
              Obx(() {
                final completeState = bloc.completeState.value;
                final roleState = bloc.roleState.value;
                final list = bloc.rolePermission;
                if ([roleState, completeState].is_loading) {
                  return const Center(child: BaseLoading());
                } else {
                  return AnimatedColumn(
                    children: list.map((e) {
                      return _Tile(
                        bloc: bloc,
                        item: e,
                      );
                    }).toList(),
                  );
                }
              }),
            ],
          ),
        );
      },
    );
  }
}

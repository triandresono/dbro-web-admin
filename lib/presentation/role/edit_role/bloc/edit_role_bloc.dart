part of 'edit_role_extender.dart';

class EditRoleBloc extends GetxController with _Extender {
  final MyPermissionUsecase myPermissionUsecase;
  final PermissionListUsecase permissionListUsecase;
  final SysconfigListUsecase sysconfigListUsecase;
  final PermissionCreateUsecase permissionCreateUsecase;
  final PermissionDeleteUsecase permissionDeleteUsecase;
  final EditRoleArgument argument;
  EditRoleBloc({
    required this.permissionCreateUsecase,
    required this.permissionDeleteUsecase,
    required this.myPermissionUsecase,
    required this.permissionListUsecase,
    required this.sysconfigListUsecase,
    required this.argument,
  });

  @override
  onInit() async {
    await getPermissionList();
    getCompletePermission();
    super.onInit();
  }

  Future<void> getPermissionList() async {
    if (argument.id.isEmpty) {
      roleState(NoParameterCase());
    } else {
      roleState(LoadingCase());
      final response = await permissionListUsecase.permission_list(
        PermissionListRequest.bigSize(argument.id).toMap(),
      );
      response.fold(
        (failure) {
          if (failure.code.equal(Consts.any.unauthorized)) {
            roleState(UnauthorizedCase());
          } else {
            roleState(ErrorCase(failure));
          }
        },
        (result) {
          (this).rolePermission.addAll(result.dtos);
          roleState(LoadedCase(result));
        },
      );
    }
  }

  Future<void> getCompletePermission() async {
    completeState(LoadingCase());
    final response = await sysconfigListUsecase.sysconfig_list(
      SysconfigListRequest.api_path().toMap(),
    );
    response.fold(
      (failure) {
        if (failure.code.equal(Consts.any.unauthorized)) {
          completeState(UnauthorizedCase());
        } else {
          completeState(ErrorCase(failure));
        }
      },
      (result) {
        List<PermissionListItem> newPath = [];
        List<String> sysid = result.dtos.map((e) => e.id).toList();
        List<String> roleid = rolePermission.map((e) => e.apiPathId).toList();
        List<String> newrole = [];
        for (String item in sysid) {
          if (roleid.contains(item) == false) {
            newrole.add(item);
          }
        }
        for (var element in newrole) {
          final item = result.dtos.firstWhere((e) => e.id == element);
          newPath.add(PermissionListItem(
            apiPathKey: item.key,
            apiPathValue: item.value,
            apiPathId: item.id,
          ));
        }
        rolePermission.addAll(newPath);
        (this).setup_permission();
        completeState(LoadedCase(result));
      },
    );
  }

  Future<void> createPermission(PermissionListItem item) async {
    item.actionState(LoadingCase());
    final result = await permissionCreateUsecase.permission_create({
      "roleId": argument.id,
      "apiPathId": item.apiPathId,
    });
    result.fold(
      (failure) async {
        await AppRouter.nav.error(desc: failure.message);
        item.actionState(ErrorCase(failure));
      },
      (result) {
        item.id = result.id;
        item.checked(true);
        item.actionState(LoadedCase(result));
      },
    );
  }

  Future<void> deletePermission(PermissionListItem item) async {
    item.actionState(LoadingCase());
    final result = await permissionDeleteUsecase.permission_delete({
      "permissionId": item.id,
    });
    result.fold(
      (failure) async {
        await AppRouter.nav.error(desc: failure.message);
        item.actionState(ErrorCase(failure));
      },
      (result) {
        item.id = "";
        item.checked(false);
        item.actionState(LoadedCase(result));
      },
    );
  }
}

part of 'rail_extender.dart';

class RailBloc extends GetxController with _Extender {
  final MyPermissionUsecase permissionUsecase;
  final LocalUsecase localUsecase;
  RailBloc({
    required this.permissionUsecase,
    required this.localUsecase,
  });

  @override
  void onInit() {
    (this).permissionList();
    super.onInit();
  }

  void permissionList() async {
    permissionState(LoadingCase());
    final response = await permissionUsecase.my_permission;
    response.fold(
      (failure) => permissionState(ErrorCase(failure)),
      (result) => permissionState(LoadedCase(result)),
    );
  }

  void setupMenu() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final segment = Uri.parse(AppRouter.nav.currentUrl).pathSegments[1];
    if (drawerState.value == false) drawerState(true);
    for (var i = 0; i < menus.length; i++) {
      menus[i].selected(false);
      for (var j = 0; j < menus[i].menus.length; j++) {
        menus[i].menus[j].selected(false);
        // menus[i].expanded(false);
        menus[i].selected(false);
      }
    }
    for (var i = 0; i < menus.length; i++) {
      if (menus[i].menuCode.equal(segment)) {
        menus[i].selected(true);
        break;
      }
    }
    for (var i = 0; i < menus.length; i++) {
      for (var j = 0; j < menus[i].menus.length; j++) {
        if (menus[i].menus[j].menuCode.equal(segment)) {
          menus[i].menus[j].selected(true);
          menus[i].expanded(true);
          menus[i].selected(true);
          break;
        }
      }
    }
  }
}

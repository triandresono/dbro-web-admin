part of 'consts.dart';

class _ConstsMenu {
  const _ConstsMenu();
  List<Menu> get menu {
    return [
      Menu(
        menuCode: DashboardPage.path,
        menuName: 'Dashboard',
        route: const DashboardRoute(),
        icon: IconlyLight.home,
      ),
      Menu(
        menuName: "User",
        icon: IconlyLight.profile,
        menus: [
          Menu(
            menuCode: UserPage.path,
            menuName: "User",
            route: const UserRoute(),
            icon: IconlyLight.profile,
          ),
        ],
      ),
      Menu(
        menuName: 'Permission',
        icon: IconlyLight.setting,
        menus: [
          Menu(
            menuCode: RolePage.path,
            menuName: "Role",
            menuKey: Consts.api_key.SYSCONFIG_LIST,
            route: const RoleRoute(),
            icon: IconlyLight.lock,
          ),
        ],
      ),
      Menu(
        menuCode: DivisionListPage.path,
        menuName: 'Division',
        route: const DivisionListRoute(),
        icon: IconlyLight.user_1,
      ),
      Menu(
        menuCode: SysconfigTypePage.path,
        menuName: 'Parameter',
        route: const SysconfigTypeRoute(),
        icon: IconlyLight.filter,
      ),
    ];
  }
}

part of '../consts.dart';

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
            menuCode: UserListPage.path,
            menuName: "User",
            route: const UserListRoute(),
            icon: IconlyLight.profile,
          ),
          Menu(
            menuCode: UserAttendancePage.path,
            menuName: "Attendance",
            route: const UserAttendanceRoute(),
            icon: IconlyLight.time_circle,
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
        menuCode: OutletListPage.path,
        menuName: 'Payroll',
        route: const OutletListRoute(),
        // icon: IconlyLight.bag_2,
        icon: Icons.local_atm_rounded,
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

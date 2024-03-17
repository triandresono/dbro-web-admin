import 'package:auto_route/auto_route.dart';
import 'package:dbro_admin/domain/usecase/local/local_usecase_impl.dart';
import 'package:dbro_admin/presentation/dashboard/dashboard_page.dart';
import 'package:dbro_admin/presentation/division/division_list/division_list_worker.dart';
import 'package:dbro_admin/presentation/division_user/division_user_list/division_user_list_worker.dart';
import 'package:dbro_admin/presentation/login/login_worker.dart';
import 'package:dbro_admin/presentation/outlet/oulet_list/outlet_list_worker.dart';
import 'package:dbro_admin/presentation/outlet/outlet_user_list/outlet_user_list_worker.dart';
import 'package:dbro_admin/presentation/parameter/sysconfig_list/sysconfig_list_worker.dart';
import 'package:dbro_admin/presentation/parameter/sysconfig_type/sysconfig_type_worker.dart';
import 'package:dbro_admin/presentation/role/edit_role/edit_role_worker.dart';
import 'package:dbro_admin/presentation/role/role/role_worker.dart';
import 'package:dbro_admin/presentation/rail/bloc/rail_extender.dart';
import 'package:dbro_admin/presentation/rail/rail_worker.dart';
import 'package:dbro_admin/presentation/splash/splash_page.dart';
import 'package:dbro_admin/presentation/user/add_user/add_user_worker.dart';
import 'package:dbro_admin/presentation/user/user_clockin/user_clockin_worker.dart';
import 'package:dbro_admin/presentation/user/user_list/user_list_worker.dart';
import 'package:dbro_admin/presentation/user/user_verify/user_verify_worker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
part 'app_router.gr.dart';
part 'route_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  final guard = _RouteGuard();

  @override
  void onNavigation(resolver, router) => guard.onNavigation(resolver, router);

  static AppRouter get nav {
    return Get.find<AppRouter>();
  }

  @override
  List<AutoRoute> get routes {
    return [
      CustomRoute(
        path: SplashPage.page,
        page: SplashRoute.page,
        initial: true,
      ),
      CustomRoute(
        path: LoginPage.page,
        page: LoginRoute.page,
      ),
      CustomRoute(
        path: UserVerifyPage.page,
        page: UserVerifyRoute.page,
      ),
      CustomRoute(
        path: RailPage.path,
        page: RailRoute.page,
        children: [
          CustomRoute(
            path: DashboardPage.path,
            page: DashboardRoute.page,
            initial: true,
          ),
          /**
          *
          */
          CustomRoute(
            path: AddUserPage.path,
            page: AddUserRoute.page,
          ),
          CustomRoute(
            path: UserListPage.path,
            page: UserListRoute.page,
          ),
          CustomRoute(
            path: UserClockinPage.path,
            page: UserClockinRoute.page,
          ),
          /**
          *
          */
          CustomRoute(
            path: RolePage.path,
            page: RoleRoute.page,
          ),
          CustomRoute(
            path: EditRolePage.path,
            page: EditRoleRoute.page,
          ),
          /**
          *
          */
          CustomRoute(
            path: SysconfigTypePage.path,
            page: SysconfigTypeRoute.page,
          ),
          CustomRoute(
            path: SysconfigListPage.path,
            page: SysconfigListRoute.page,
          ),
          /**
          *
          */
          CustomRoute(
            path: DivisionListPage.path,
            page: DivisionListRoute.page,
          ),
          CustomRoute(
            path: DivisionUserListPage.path,
            page: DivisionUserListRoute.page,
          ),
          /**
          *
          */
          CustomRoute(
            path: OutletListPage.path,
            page: OutletListRoute.page,
          ),
          CustomRoute(
            path: OutletuserListPage.path,
            page: OutletuserListRoute.page,
          ),
        ],
      ),
    ];
  }
}

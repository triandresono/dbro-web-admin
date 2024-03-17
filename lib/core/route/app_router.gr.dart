// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddUserRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddUserPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
    DivisionListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DivisionListPage(),
      );
    },
    DivisionUserListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DivisionUserListPage(),
      );
    },
    EditRoleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditRolePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    OutletListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OutletListPage(),
      );
    },
    OutletuserListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OutletuserListPage(),
      );
    },
    RailRoute.name: (routeData) {
      final args =
          routeData.argsAs<RailRouteArgs>(orElse: () => const RailRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RailPage(key: args.key),
      );
    },
    RoleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RolePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    SysconfigListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SysconfigListPage(),
      );
    },
    SysconfigTypeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SysconfigTypePage(),
      );
    },
    UserAttendanceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserAttendancePage(),
      );
    },
    UserClockinRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserClockinPage(),
      );
    },
    UserListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserListPage(),
      );
    },
    UserVerifyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserVerifyPage(),
      );
    },
  };
}

/// generated route for
/// [AddUserPage]
class AddUserRoute extends PageRouteInfo<void> {
  const AddUserRoute({List<PageRouteInfo>? children})
      : super(
          AddUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddUserRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DivisionListPage]
class DivisionListRoute extends PageRouteInfo<void> {
  const DivisionListRoute({List<PageRouteInfo>? children})
      : super(
          DivisionListRoute.name,
          initialChildren: children,
        );

  static const String name = 'DivisionListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DivisionUserListPage]
class DivisionUserListRoute extends PageRouteInfo<void> {
  const DivisionUserListRoute({List<PageRouteInfo>? children})
      : super(
          DivisionUserListRoute.name,
          initialChildren: children,
        );

  static const String name = 'DivisionUserListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditRolePage]
class EditRoleRoute extends PageRouteInfo<void> {
  const EditRoleRoute({List<PageRouteInfo>? children})
      : super(
          EditRoleRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditRoleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OutletListPage]
class OutletListRoute extends PageRouteInfo<void> {
  const OutletListRoute({List<PageRouteInfo>? children})
      : super(
          OutletListRoute.name,
          initialChildren: children,
        );

  static const String name = 'OutletListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OutletuserListPage]
class OutletuserListRoute extends PageRouteInfo<void> {
  const OutletuserListRoute({List<PageRouteInfo>? children})
      : super(
          OutletuserListRoute.name,
          initialChildren: children,
        );

  static const String name = 'OutletuserListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RailPage]
class RailRoute extends PageRouteInfo<RailRouteArgs> {
  RailRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RailRoute.name,
          args: RailRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RailRoute';

  static const PageInfo<RailRouteArgs> page = PageInfo<RailRouteArgs>(name);
}

class RailRouteArgs {
  const RailRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RailRouteArgs{key: $key}';
  }
}

/// generated route for
/// [RolePage]
class RoleRoute extends PageRouteInfo<void> {
  const RoleRoute({List<PageRouteInfo>? children})
      : super(
          RoleRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SysconfigListPage]
class SysconfigListRoute extends PageRouteInfo<void> {
  const SysconfigListRoute({List<PageRouteInfo>? children})
      : super(
          SysconfigListRoute.name,
          initialChildren: children,
        );

  static const String name = 'SysconfigListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SysconfigTypePage]
class SysconfigTypeRoute extends PageRouteInfo<void> {
  const SysconfigTypeRoute({List<PageRouteInfo>? children})
      : super(
          SysconfigTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'SysconfigTypeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserAttendancePage]
class UserAttendanceRoute extends PageRouteInfo<void> {
  const UserAttendanceRoute({List<PageRouteInfo>? children})
      : super(
          UserAttendanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserAttendanceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserClockinPage]
class UserClockinRoute extends PageRouteInfo<void> {
  const UserClockinRoute({List<PageRouteInfo>? children})
      : super(
          UserClockinRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserClockinRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserListPage]
class UserListRoute extends PageRouteInfo<void> {
  const UserListRoute({List<PageRouteInfo>? children})
      : super(
          UserListRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserVerifyPage]
class UserVerifyRoute extends PageRouteInfo<void> {
  const UserVerifyRoute({List<PageRouteInfo>? children})
      : super(
          UserVerifyRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserVerifyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

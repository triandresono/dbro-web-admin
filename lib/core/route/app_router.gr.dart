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
    UserRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserPage(),
      );
    },
  };
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
/// [UserPage]
class UserRoute extends PageRouteInfo<void> {
  const UserRoute({List<PageRouteInfo>? children})
      : super(
          UserRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

part of 'app_router.dart';

// class _RouteGuard {
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     var user = LocalUsecaseImpl(Get.find()).get_user;
//     var name = resolver.route.name;
//     if (user.token.isNotEmpty) {
//       if (name == LoginRoute.name) {
//         resolver.redirect(const DashboardRoute());
//       } else {
//         Get.find<NavigationBloc>().setupMenu();
//         resolver.next();
//       }
//     } else {
//       if (user.token.isNotEmpty || name == LoginRoute.name) {
//         resolver.next();
//       } else {
//         resolver.redirect(const LoginRoute());
//       }
//     }
//   }
// }

class _RouteGuard {
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final user = LocalUsecaseImpl(Get.find()).get_user;
    final name = resolver.route.name;
    if (user.token.isNotEmpty) {
      if (name == LoginRoute.name) {
        resolver.redirect(const DashboardRoute());
      } else if (name == UserVerifyRoute.name) {
        resolver.next();
      } else {
        Get.find<RailBloc>().setupMenu();
        resolver.next();
      }
    } else {
      if (name == UserVerifyRoute.name) {
        resolver.next();
      } else if (user.token.isNotEmpty || name == LoginRoute.name) {
        resolver.next();
      } else {
        resolver.redirect(const LoginRoute());
      }
    }
  }
}

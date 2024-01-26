// part of 'extension.dart';

// extension AppRouteExtension on AppRouter {
//   void replaceRoute(PageRouteInfo<dynamic> route) {
//     Get.find<CoreNavigationBloc>().setup(route.routeName);
//     (this).replace(route);
//   }

//   void replaceRouteNamed(String route) {
//     var str = route.toLowerCase();
//     Get.find<CoreNavigationBloc>().setup(str);
//     (this).replaceNamed('/$str');
//   }

//   void initReplace(PageRouteInfo<dynamic> route) {
//     Get.find<CoreNavigationBloc>().initRoute(route.routeName);
//     (this).replace(route);
//   }
// }

part of '../extension.dart';

extension AppRouterExtension on AppRouter {
  dynamic replaceParameter(
    PageRouteInfo<dynamic> route, {
    Map<String, String> parameter = const {},
  }) {
    if (parameter.isNotEmpty) {
      Map<String, String> argument = {};
      parameter.forEach((key, value) {
        argument[key] = value.encrypt_AES;
      });
      return (this).replace(route.copyWith(
        queryParams: argument,
        params: argument,
      ));
    } else {
      (this).replace(route);
    }
  }

  dynamic pushParemeter(
    PageRouteInfo<dynamic> route, {
    Map<String, String> parameter = const {},
    bool encrypt = true,
  }) {
    if (parameter.isNotEmpty) {
      Map<String, String> argument = {};
      parameter.forEach((key, value) {
        if (encrypt) {
          argument[key] = value.encrypt_AES;
        } else {
          argument[key] = value;
        }
      });
      return (this).push(route.copyWith(
        queryParams: argument,
        params: argument,
      ));
    } else {
      (this).replace(route);
    }
  }

  Future<dynamic> error({
    String? title,
    String desc = '',
    String mainButtonTitle = "Okay",
    String? secondaryTitle,
    bool dismissable = true,
  }) async {
    final result = await showDialog(
      context: (this).navigatorKey.currentContext!,
      barrierDismissible: dismissable,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
          child: ErrorDialog2(
            title: title,
            desc: desc,
            mainButtonTitle: mainButtonTitle,
            secondaryTitle: secondaryTitle,
          ),
        );
      },
    );
    return result;
  }

  Future<dynamic> dialog({
    required Widget dialog,
    bool dismissable = true,
  }) async {
    var result = await showDialog(
      context: (this).navigatorKey.currentContext!,
      barrierDismissible: dismissable,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
          child: dialog,
        );
      },
    );
    return result;
  }

  bool get isDialogOpen {
    final ctx = (this).navigatorKey.currentContext;
    if (ctx != null) {
      return ModalRoute.of(ctx)?.isCurrent ?? false;
    } else {
      return false;
    }
  }
}

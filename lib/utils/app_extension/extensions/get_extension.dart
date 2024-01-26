part of '../extension.dart';

extension GetExtension on GetInterface {
  void lazy<T>(T object) {
    (this).lazyPut<T>(() => object, fenix: true);
  }

  void perm<T>(T object) {
    (this).put(object, permanent: true);
  }

  dynamic goOffNamed(String route, {Map<String, String>? parameters}) {
    return (this).rootDelegate.offNamed(route, parameters: parameters);
  }

  dynamic goNamed(String route, {Map<String, String>? parameters}) {
    return (this).rootDelegate.toNamed(route, parameters: parameters);
  }

  Future<dynamic> error({
    String? title,
    String desc = '',
    String mainButtonTitle = "Okay",
    String? secondaryTitle,
    bool dismissable = true,
  }) async {
    var result = await Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
        child: ErrorDialog(
          title: title,
          desc: desc,
          mainButtonTitle: mainButtonTitle,
          secondaryTitle: secondaryTitle,
        ),
      ),
      barrierDismissible: dismissable,
    );
    return result;
  }
}

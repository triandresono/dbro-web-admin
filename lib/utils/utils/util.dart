import 'dart:async';
import 'dart:math';
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/presentation/rail/rail_worker.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Util {
  ///LISTENED STATE WITH LOADING
  static Worker listen<T>({
    required RxInterface<Case<T>> listener,
    required WorkerCallback<Case<T>> callback,
  }) {
    StreamSubscription sub = listener.listen(
      (event) {
        callback(event);
      },
    );
    return Worker(sub.cancel, '[ever]');
  }

  static Future<Map<String, String>> get uriParameter async {
    await Future.delayed(const Duration(microseconds: 100));
    final data = Uri.dataFromString(Uri.base.toString()).queryParameters;
    if (data.isNotEmpty) {
      Map<String, String> argument = {};
      data.forEach((key, value) {
        argument[key] = value.decrypt_AES;
      });
      return argument;
    } else {
      return {};
    }
  }

  static Map<String, String> get queryParemeter {
    final data = Uri.dataFromString(AppRouter.nav.currentUrl).queryParameters;
    if (data.isNotEmpty) {
      Map<String, String> argument = {};
      data.forEach((key, value) {
        argument[key] = value.decrypt_AES;
      });
      return argument;
    } else {
      return {};
    }
  }

  static Map<String, String> get rawParameter {
    final data = Uri.dataFromString(AppRouter.nav.currentUrl).queryParameters;
    if (data.isNotEmpty) {
      return data;
    } else {
      return {};
    }
  }

  static String randomString(int length) {
    final random = Random();
    const characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return String.fromCharCodes(Iterable.generate(
      length,
      (_) => characters.codeUnitAt(random.nextInt(characters.length)),
    ));
  }

  static Widget? drawer(BuildContext context) {
    if (context.isdesktop) {
      return null;
    } else {
      return RailDrawer();
    }
  }
}

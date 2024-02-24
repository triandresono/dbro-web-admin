part of '../consts.dart';

class _ConstsPermission {
  const _ConstsPermission();
  List<String> get edit_role {
    return [
      Consts.api_key.PERMISSION_LIST,
      Consts.api_key.SYSCONFIG_LIST,
      Consts.api_key.PERMISSION_CREATE,
    ];
  }
}

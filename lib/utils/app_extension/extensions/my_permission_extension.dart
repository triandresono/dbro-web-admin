part of '../extension.dart';

extension MyPermissionExtension on MyPermission {
  List<bool> permissionFilter(List<String> keys) {
    List<bool> filter = [];
    for (var permission in (this).list) {
      for (var api_key in keys) {
        filter.add(permission.apiPathKey.equal(api_key));
      }
    }
    return filter;
  }

  bool permissionFilter2(List<String> keys) {
    List<bool> filter = [];
    // for (var api_key in keys) {
    //   for (var permission in (this).list) {
    //     filter.add(permission.apiPathKey.equal(api_key));
    //   }
    // }
    for (String item in keys) {
      filter.add(
        (this).list.map((e) => e.apiPathKey).toList().contains(item),
      );
    }
    // for (var permission in (this).list) {
    //   for (var api_key in keys) {
    //     filter.add(permission.apiPathKey.equal(api_key));
    //   }
    // }
    return filter.every((e) => e == true);
  }
}

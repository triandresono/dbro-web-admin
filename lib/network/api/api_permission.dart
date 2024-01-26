part of 'api.dart';

class _Permission with Api {
  const _Permission();

  String get my_permission => '${_permission}list-my-permission'.uri;
  String get list => '${_permission}list'.uri;
  String get create => '${_permission}create'.uri;
  String get delete => '${_permission}delete'.uri;
}

part of 'api.dart';

class _SysConfig with Api {
  const _SysConfig();

  String get list => '${_sysconfig}list'.uri;
  String get create => '${_sysconfig}create'.uri;
  String get delete => '${_sysconfig}delete'.uri;
  String get roleDropdown => '${_sysconfig}role-dropdown'.uri;
}

part of 'api.dart';

class _SysConfigType with Api {
  const _SysConfigType();

  String get list => '${_sysconfig_type}list'.uri;
  String get detail => '${_sysconfig_type}detail'.uri;
}

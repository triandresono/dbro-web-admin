// ignore_for_file: constant_identifier_names

import 'package:dbro_admin/utils/app_extension/extension.dart';

part 'api_user.dart';
part 'api_permission.dart';
part 'api_sysconfig.dart';
part 'api_sysconfig_type.dart';
part 'api_division.dart';
part 'api_payroll.dart';
part 'api_clockin.dart';

mixin class Api {
  String get _sysconfig_type => '/api/sysconfig-type/';
  String get _permission => '/api/permission/';
  String get _sysconfig => '/api/sysconfig/';
  String get _division => '/api/division/';
  String get _payroll => '/api/payroll/';
  String get _clockin => '/api/clock-in/';
  String get _user => '/api/user/';

  static const sysconfig_type = _SysConfigType();
  static const permission = _Permission();
  static const sysconfig = _SysConfig();
  static const division = _Division();
  static const clockin = _Clockin();
  static const payroll = _Payroll();
  static const user = _User();
}

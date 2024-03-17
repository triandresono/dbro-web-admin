part of 'api.dart';

class _User with Api {
  const _User();

  String get login => '${_user}login'.uri;
  String get logout => '${_user}logout'.uri;
  String get dropdown => '${_user}dropdown'.uri;
  String get register => '${_user}register'.uri;
  String get all => '${_user}list-all'.uri;
  String get verify => '${_user}verify-register'.uri;
  String get updatePayroll => '${_user}update-payroll-info'.uri;
  String get attendance => '${_user}list-attendance'.uri;
}

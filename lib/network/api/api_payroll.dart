part of 'api.dart';

class _Payroll with Api {
  const _Payroll();

  String get userList => '${_payroll}list-user-by-division'.uri;
  String get calulatePayroll => '${_payroll}calculate-by-division'.uri;
}

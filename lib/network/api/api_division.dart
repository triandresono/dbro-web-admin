part of 'api.dart';

class _Division with Api {
  const _Division();

  String get root => '${_division}list-root'.uri;
  String get child => '${_division}list-child'.uri;
  String get create => '${_division}create'.uri;
  String get dropdown => '${_division}dropdown'.uri;
  String get createRelation => '${_division}create-relation'.uri;
  String get addUser => '${_division}add-user'.uri;
  String get userList => '${_division}list-user'.uri;
  String get removeUser => '${_division}remove-user'.uri;
  String get listOutlet => '${_division}list-outlet'.uri;
  String get updatePayroll => '${_division}update-payroll-info'.uri;
}

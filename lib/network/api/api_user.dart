part of 'api.dart';

class _User with Api {
  const _User();

  String get login => '${_user}login'.uri;
  String get logout => '${_user}logout'.uri;
  String get dropdown => '${_user}dropdown'.uri;
}

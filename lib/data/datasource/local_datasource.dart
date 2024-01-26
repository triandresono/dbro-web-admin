import 'dart:convert';
import 'package:dbro_admin/domain/entity/auth/login.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatasource {
  final SharedPreferences pref;
  const LocalDatasource(this.pref);

  Future<void> clear() async {
    await pref.clear();
  }

  Future<void> clear_user() async {
    await pref.remove('login');
  }

  Future<void> save_user(Login login) async {
    await pref.setString('login', json.encode(login.toMap()).encrypt_AES);
  }

  Login get get_user {
    final data = pref.getString('login').decrypt_AES;
    if (data.isNotEmpty) {
      return Login.fromMap(json.decode(data));
    } else {
      return Login();
    }
  }

  Future<void> clear_secret() async {
    await pref.remove('otsc');
  }

  Future<void> save_secret(String secret) async {
    await pref.setString('otsc', secret.encrypt_64.chars16String);
  }

  String get get_secret {
    final data = pref.getString('otsc') ?? '';
    return data.isNotEmpty ? data : '';
  }
}

part of '../extension.dart';

extension StringExtension on String? {
  String get capsSnakeCase {
    var str = this ?? '';
    return str.replaceAll(" ", "_").toUpperCase();
  }

  bool equal(String compared) {
    var str = this ?? '';
    if (str.isNotEmpty) {
      return str.toUpperCase() == compared.toUpperCase();
    } else {
      return false;
    }
  }

  bool unequal(String compared) {
    var str = this ?? '';
    if (str.isNotEmpty) {
      return str.toUpperCase() != compared.toUpperCase();
    } else {
      return false;
    }
  }

  String get encrypt_AES {
    final str = this ?? '';
    final key_variable = LocalUsecaseImpl(Get.find()).get_secret;
    final key = e.Key.fromUtf8(key_variable);
    final iv = e.IV.fromUtf8(Consts.base_iv);
    final encrypter = e.Encrypter(e.AES(key, mode: e.AESMode.cbc));
    final encrypted = encrypter.encrypt(str, iv: iv);
    return encrypted.base64;
  }

  String get decrypt_AES {
    final str = this ?? '';
    if (LocalUsecaseImpl(Get.find()).get_secret.isNotEmpty) {
      final key = e.Key.fromUtf8(LocalUsecaseImpl(Get.find()).get_secret);
      final iv = e.IV.fromUtf8(Consts.base_iv);
      final encrypter = e.Encrypter(e.AES(key, mode: e.AESMode.cbc));
      final decrypted = encrypter.decrypt64(str, iv: iv);
      return decrypted;
    } else {
      return '';
    }
  }

  String get encrypt_64 {
    final str = this ?? '';
    final encoded = base64.encode(utf8.encode(str));
    return encoded;
  }

  String get decrypt_64 {
    final str = this ?? '';
    final decoded = utf8.decode(base64.decode(str));
    return decoded;
  }

  String get uri {
    final str = this ?? '';
    return (Flavor.map(Consts.base_key) as String) + str;
  }

  String get chars16String {
    final str = this ?? '';
    if (str.length == 16) {
      return str;
    } else if (str.length > 16) {
      return str.substring(0, 16);
    } else {
      final randomString = Util.randomString(16 - str.length);
      return str.padRight(16, randomString);
    }
  }

  String get titleCase {
    final str = this ?? '';
    List<String> words = str.split('_');
    words = words.map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }
      return '';
    }).toList();
    return words.join(' ');
  }
}

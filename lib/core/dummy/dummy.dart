// ignore_for_file: library_private_types_in_public_api

import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/data/response/sysconfig/sysconfig_list_response.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

part 'dummies/sysconfig_dummy.dart';
part 'dummies/division_dummy.dart';
part 'dummies/user_dummy.dart';

class Dummy {
  static const _Division division = _Division();
  static const _SysConfig sysconfig = _SysConfig();
  static const _User user = _User();
}

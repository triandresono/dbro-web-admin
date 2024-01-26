// ignore_for_file: library_private_types_in_public_api

import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

part 'dummy/division_dummy.dart';
part 'dummy/user_dummy.dart';

class Dummy {
  static const _Division division = _Division();
  static const _User user = _User();
}

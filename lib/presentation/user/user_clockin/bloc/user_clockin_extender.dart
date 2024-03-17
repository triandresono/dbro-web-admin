import 'package:dbro_admin/domain/entity/clockin/clockin_user_list.dart';
import 'package:dbro_admin/domain/usecase/clockin_userlist/clockin_userlist_usecase.dart';
import 'package:dbro_admin/presentation/user/user_clockin/argument/user_clockin_argument.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:dbro_admin/utils/constants/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'user_clockin_bloc.dart';

mixin class _Extender {
  final userCase = Case<ClockInUserList>().obs;
  final userNameCo = TextEditingController();

  void _dispose() {
    userNameCo.dispose();
  }
}

import 'package:dbro_admin/domain/entity/payroll/payroll_user_list.dart';
import 'package:dbro_admin/domain/usecase/payroll_user/payroll_user_usecase.dart';
import 'package:dbro_admin/presentation/outlet/outlet_user_list/argument/outlet_user_list_argument.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:dbro_admin/utils/constants/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'outlet_user_list_bloc.dart';

mixin class _Extender {
  final userCase = Case<PayrollUserList>().obs;
  final divisionCo = TextEditingController();

  void _dispose() {
    divisionCo.dispose();
  }
}

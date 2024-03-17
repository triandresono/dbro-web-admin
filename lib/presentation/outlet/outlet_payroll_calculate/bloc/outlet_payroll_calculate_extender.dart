import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_list.dart';
import 'package:dbro_admin/domain/usecase/payroll_calculate/payroll_calculate_usecase.dart';
import 'package:dbro_admin/presentation/outlet/outlet_payroll_calculate/argument/outlet_payroll_calculate_argument.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'outlet_payroll_calculate_bloc.dart';

mixin class _Extender {
  final payrollCase = Case<dynamic>().obs;
  final formKey = GlobalKey<FormState>();
  final periodCo = TextEditingController();
  final valid = false.obs;
  SysconfigListItem? periodVal;

  void _dispose() {
    periodCo.dispose();
  }
}

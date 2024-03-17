import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/usecase/division_update_payroll/division_update_payroll_usecase.dart';
import 'package:dbro_admin/presentation/outlet/outlet_edit_bonus/argument/outlet_edit_bonus_argument.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'outlet_edit_bonus_bloc.dart';

mixin class _Extender {
  final submitCase = Case<StatusResponse>().obs;
  final harianCo = TextEditingController();
  final kawakaCo = TextEditingController();

  void _dispose() {
    harianCo.dispose();
    kawakaCo.dispose();
  }
}

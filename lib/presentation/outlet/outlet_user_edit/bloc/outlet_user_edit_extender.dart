import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/usecase/user_update_payroll/user_update_payroll_usecase.dart';
import 'package:dbro_admin/presentation/outlet/outlet_user_edit/argument/outlet_user_edit_argument.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
part 'outlet_user_edit_bloc.dart';

mixin class _Extender {
  final submitCase = Case<GetId>().obs;
  final gajiPokokCo = TextEditingController();
  final uangMakanCo = TextEditingController();
  final potonganCo = TextEditingController();

  void _dispose() {
    gajiPokokCo.dispose();
    uangMakanCo.dispose();
    potonganCo.dispose();
  }
}

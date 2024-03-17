import 'package:dbro_admin/domain/entity/division/outlet_payroll_list.dart';
import 'package:dbro_admin/domain/usecase/outlet_list/outlet_list_usecase.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:dbro_admin/utils/constants/consts.dart';
import 'package:get/get.dart';

part 'outlet_list_bloc.dart';

mixin class _Extender {
  final listCase = Case<OutletPayrollList>().obs;
}

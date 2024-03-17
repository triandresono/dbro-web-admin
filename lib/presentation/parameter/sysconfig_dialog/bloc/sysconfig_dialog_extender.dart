import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_list.dart';
import 'package:dbro_admin/domain/usecase/sysconfig_list/sysconfog_list_usecase.dart';
import 'package:dbro_admin/presentation/parameter/sysconfig_dialog/argument/sysconfig_dialog_argument.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:get/get.dart';

part 'sysconfig_dialog_bloc.dart';

mixin class _Extender {
  final configCase = Case<SysconfigList>().obs;
  final selected = Rxn<SysconfigListItem>(null);
}

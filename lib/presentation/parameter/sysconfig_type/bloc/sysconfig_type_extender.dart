import 'package:dbro_admin/utils/constants/consts.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_type_list.dart';
import 'package:dbro_admin/domain/usecase/sysconfig_type_list/sysconfig_type_list_usecase.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:get/get.dart';

part 'sysconfig_type_bloc.dart';

mixin class _Extender {
  var types = <SysconfigTypeListItem>[].obs;
  final typeState = Case<SysconfigTypeList>().obs;
}

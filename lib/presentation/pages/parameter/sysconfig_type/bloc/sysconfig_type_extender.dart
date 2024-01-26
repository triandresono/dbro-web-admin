import 'package:dbro_admin/core/constants/consts.dart';
import 'package:dbro_admin/core/state_builder/case.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_type_list.dart';
import 'package:dbro_admin/domain/usecase/sysconfig_type_list_usecase/sysconfig_type_list_usecase.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:get/get.dart';

part 'sysconfig_type_bloc.dart';

mixin class _Extender {
  var types = <SysconfigTypeListItem>[].obs;
  final typeState = Case<SysconfigTypeList>().obs;
}

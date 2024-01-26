import 'package:dbro_admin/core/state_builder/case.dart';
import 'package:dbro_admin/data/dto/request/sysconfig_list_request.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_list.dart';
import 'package:dbro_admin/domain/usecase/sysconfig_list_usecase/sysconfog_list_usecase.dart';
import 'package:dbro_admin/presentation/pages/parameter/sysconfig_list/argument/sysconfig_list_argument.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/consts.dart';

part 'sysconfig_list_bloc.dart';

mixin class _Extender {
  void increment() => request.page = request.page + 1;
  var sysList = <SysconfigListItem>[].obs;
  var request = SysconfigListRequest();
  final listState = Case().obs;
  final totalCount = 0.obs;
  final isInit = false.obs;
}

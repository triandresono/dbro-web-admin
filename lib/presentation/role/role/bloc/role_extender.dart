import 'package:dbro_admin/utils/constants/consts.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/data/request/sysconfig_list_request.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_list.dart';
import 'package:dbro_admin/domain/usecase/sysconfig_list/sysconfog_list_usecase.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:get/get.dart';
part 'role_bloc.dart';

mixin class _Extender {
  void reset() => request = SysconfigListRequest.role();
  void increment() => request.page = request.page + 1;
  var roles = <SysconfigListItem>[].obs;
  var request = SysconfigListRequest.role();
  final roleState = Case().obs;
  final totalCount = 0.obs;
  final isInit = false.obs;
}

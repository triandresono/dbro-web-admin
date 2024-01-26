// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/core/state_builder/case.dart';
import 'package:dbro_admin/data/dto/request/permission_list_request.dart';
import 'package:dbro_admin/data/dto/request/sysconfig_list_request.dart';
import 'package:dbro_admin/domain/entity/permission/permission_list.dart';
import 'package:dbro_admin/domain/usecase/my_permission_usecase/my_permission_usecase.dart';
import 'package:dbro_admin/domain/usecase/permission_create_usecase/permission_create_usecase.dart';
import 'package:dbro_admin/domain/usecase/permission_delete_usecase/permission_delete_usecase.dart';
import 'package:dbro_admin/domain/usecase/permission_list_usecase/permission_list_usecase.dart';
import 'package:dbro_admin/domain/usecase/sysconfig_list_usecase/sysconfog_list_usecase.dart';
import 'package:dbro_admin/presentation/pages/role/edit_role/argument/edit_role_argument.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:get/get.dart';
import 'package:dbro_admin/core/constants/consts.dart';
part 'edit_role_bloc.dart';

mixin class _Extender {
  var copmpletePermission = <PermissionListItem>[].obs;
  var rolePermission = <PermissionListItem>[].obs;
  final myPermissionState = Case().obs;
  final completeState = Case().obs;
  final paramState = Case().obs;
  final roleState = Case().obs;

  void setup_permission() {
    rolePermission.forEach((e) {
      e.checked(e.id.isNotEmpty);
    });
  }

  // Future<void> getParam() async {
  //   paramState(LoadingCase());
  //   argument.addAll(await Util.uriParameter);
  //   if (argument.isEmpty) {
  //     paramState(NoParameterCase());
  //   } else {
  //     paramState(LoadedCase(argument));
  //   }
  // }
}

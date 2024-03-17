import 'package:dbro_admin/utils/constants/consts.dart';
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/domain/entity/any/menu.dart';
import 'package:dbro_admin/domain/entity/permission/my_permission.dart';
import 'package:dbro_admin/domain/usecase/local/local_usecase.dart';
import 'package:dbro_admin/domain/usecase/my_permission/my_permission_usecase.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:get/get.dart';
part 'rail_bloc.dart';

mixin class _Extender {
  MyPermission get pervalue => permissionState.value.data ?? MyPermission();
  final permissionState = Case<MyPermission>().obs;
  List<Menu> menus = Consts.menus.menu;
  final drawerState = false.obs;
  final currentPath = ''.obs;
}

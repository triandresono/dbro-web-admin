// ignore_for_file: constant_identifier_names
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/domain/entity/any/menu.dart';
import 'package:dbro_admin/presentation/dashboard/dashboard_page.dart';
import 'package:dbro_admin/presentation/division/division_list/division_list_worker.dart';
import 'package:dbro_admin/presentation/outlet/oulet_list/outlet_list_worker.dart';
import 'package:dbro_admin/presentation/parameter/sysconfig_type/sysconfig_type_worker.dart';
import 'package:dbro_admin/presentation/role/role/role_worker.dart';
import 'package:dbro_admin/presentation/user/user_list/user_list_worker.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
part 'constants/consts_permission.dart';
part 'constants/consts_apikey.dart';
part 'constants/consts_base_uri.dart';
part 'constants/consts_menu.dart';
part 'constants/consts_shadow.dart';
part 'constants/consts_any.dart';

class Consts {
  static const base_key = "base_key";
  static const base_iv = "aesEncryptionIV!";
  static const sys_master_id = "e4a01021-d3f5-4e58-b82e-4fe44b301b69";
  static const permissions = _ConstsPermission();
  static const api_key = _ConstsApikey();
  static const base_uri = _Base();
  static const menus = _ConstsMenu();
  static const shadow = _ConstsShadow();
  static const any = _ConstsAny();
}

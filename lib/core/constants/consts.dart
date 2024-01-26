// ignore_for_file: constant_identifier_names
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/domain/entity/any/menu.dart';
import 'package:dbro_admin/presentation/pages/dashboard/dashboard_page.dart';
import 'package:dbro_admin/presentation/pages/division/division_list/division_list_worker.dart';
import 'package:dbro_admin/presentation/pages/parameter/sysconfig_type/sysconfig_type_worker.dart';
import 'package:dbro_admin/presentation/pages/role/role/role_worker.dart';
import 'package:dbro_admin/presentation/pages/user/user/user_page.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
part 'consts_permission.dart';
part 'consts_apikey.dart';
part 'consts_base_uri.dart';
part 'consts_menu.dart';
part 'consts_shadow.dart';
part 'consts_any.dart';

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

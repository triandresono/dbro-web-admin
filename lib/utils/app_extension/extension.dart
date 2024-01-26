import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:dbro_admin/core/flavor/flavor.dart';
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/core/state_builder/case.dart';
import 'package:dbro_admin/core/util/util.dart';
import 'package:dbro_admin/domain/entity/permission/my_permission.dart';
import 'package:dbro_admin/ui_kit/dialog/error_dialog.dart';
import 'package:dbro_admin/ui_kit/dialog/error_dialog_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'dart:convert';
import 'package:dbro_admin/core/constants/consts.dart';
import 'package:dbro_admin/domain/usecase/local_usecase/local_usecase_impl.dart';
import 'package:encrypt/encrypt.dart' as e;
part 'extensions/rx_list_extension.dart';
part 'extensions/context_extension.dart';
part 'extensions/bool_extension.dart';
part 'extensions/get_extension.dart';
part 'extensions/string_extension.dart';
part 'extensions/app_router_extension.dart';
part 'extensions/my_permission_extension.dart';
part 'extensions/list_case_extension.dart';

// part 'route_extension.dart';

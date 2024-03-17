import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:dbro_admin/core/flavor/flavor.dart';
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/utils/utils/util.dart';
import 'package:dbro_admin/domain/entity/permission/my_permission.dart';
import 'package:dbro_admin/ui_kit/dialog/error_dialog.dart';
import 'package:dbro_admin/ui_kit/dialog/error_dialog_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'dart:convert';
import 'package:dbro_admin/utils/constants/consts.dart';
import 'package:dbro_admin/domain/usecase/local/local_usecase_impl.dart';
import 'package:encrypt/encrypt.dart' as e;
part 'extensions/rx_list_extension.dart';
part 'extensions/context_extension.dart';
part 'extensions/bool_extension.dart';
part 'extensions/get_extension.dart';
part 'extensions/string_extension.dart';
part 'extensions/app_router_extension.dart';
part 'extensions/my_permission_extension.dart';
part 'extensions/list_case_extension.dart';
part 'extensions/date_extension.dart';
part 'extensions/num_extension.dart';


// part 'route_extension.dart';

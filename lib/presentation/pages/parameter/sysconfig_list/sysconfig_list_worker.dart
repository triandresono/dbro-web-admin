import 'package:auto_route/auto_route.dart';
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/core/state_builder/case.dart';
import 'package:dbro_admin/core/util/util.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_list.dart';
import 'package:dbro_admin/presentation/error/no_parameter/no_parameter_page.dart';
import 'package:dbro_admin/presentation/error/no_permission/no_permission_page.dart';
import 'package:dbro_admin/presentation/pages/parameter/add_sysconfig/add_sysconfig_worker.dart';
import 'package:dbro_admin/presentation/pages/parameter/sysconfig_list/argument/sysconfig_list_argument.dart';
import 'package:dbro_admin/presentation/pages/parameter/sysconfig_list/bloc/sysconfig_list_extender.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/entity/bar.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:dbro_admin/ui_kit/widgets/animated_children.dart';
import 'package:dbro_admin/ui_kit/widgets/base_appbar.dart';
import 'package:dbro_admin/ui_kit/widgets/base_button_icon.dart';
import 'package:dbro_admin/ui_kit/widgets/base_field_prefix.dart';
import 'package:dbro_admin/ui_kit/widgets/expanded_row.dart';
import 'package:dbro_admin/ui_kit/widgets/prefix_builder_base_input.dart';
import 'package:dbro_admin/ui_kit/widgets/table_button.dart';
import 'package:dbro_admin/ui_kit/widgets/table_parent.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:dbro_admin/ui_kit/widgets/web_pagination.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dbro_admin/core/state_builder/get_state.dart';
import 'package:dbro_admin/core/state_builder/get_state_builder.dart';
import 'package:iconly/iconly.dart';
import 'package:skeletonizer/skeletonizer.dart';
part 'component/sysconfig_list_table.dart';
part 'sysconfig_list_page.dart';

mixin class _Worker {
  final bloc = Get.find<SysconfigListBloc>();
}

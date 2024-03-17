import 'package:auto_route/auto_route.dart';
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/domain/entity/division/outlet_payroll_list.dart';
import 'package:dbro_admin/presentation/error/no_permission/no_permission_page.dart';
import 'package:dbro_admin/presentation/outlet/oulet_list/bloc/outlet_list_extender.dart';
import 'package:dbro_admin/presentation/outlet/outlet_edit_bonus/argument/outlet_edit_bonus_argument.dart';
import 'package:dbro_admin/presentation/outlet/outlet_edit_bonus/outlet_edit_bonus_worker.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/entity/bar.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/ui_kit/widgets/animated_children.dart';
import 'package:dbro_admin/ui_kit/widgets/base_appbar.dart';
import 'package:dbro_admin/ui_kit/widgets/empty_state.dart';
import 'package:dbro_admin/ui_kit/widgets/table_button.dart';
import 'package:dbro_admin/ui_kit/widgets/table_parent.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:dbro_admin/utils/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:dbro_admin/ui_kit/state/get_state.dart';
import 'package:dbro_admin/ui_kit/state/get_state_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';
part 'outlet_list_page.dart';
part 'component/outlet_list_table.dart';

mixin class _Worker {
  final bloc = Get.find<OutletListBloc>();
}

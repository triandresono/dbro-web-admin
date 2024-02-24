// ignore_for_file: unused_import

import 'package:auto_route/auto_route.dart';
import 'package:dbro_admin/utils/constants/consts.dart';
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/ui_kit/state/get_state.dart';
import 'package:dbro_admin/ui_kit/state/get_state_builder.dart';
import 'package:dbro_admin/utils/utils/util.dart';
import 'package:dbro_admin/presentation/division/division_add/division_add_worker.dart';
import 'package:dbro_admin/presentation/division/division_add_relation/argument/division_add_relation_argument.dart';
import 'package:dbro_admin/presentation/division/division_add_relation/division_add_relation_worker.dart';
import 'package:dbro_admin/presentation/division/division_list/bloc/division_list_extender.dart';
import 'package:dbro_admin/presentation/division/division_list/model/division_list_ui.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/entity/bar.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:dbro_admin/ui_kit/widgets/animated.dart';
import 'package:dbro_admin/ui_kit/widgets/animated_children.dart';
import 'package:dbro_admin/ui_kit/widgets/base_appbar.dart';
import 'package:dbro_admin/ui_kit/widgets/base_button_icon.dart';
import 'package:dbro_admin/ui_kit/widgets/base_container.dart';
import 'package:dbro_admin/ui_kit/widgets/base_loading.dart';
import 'package:dbro_admin/ui_kit/widgets/blank_builder.dart';
import 'package:dbro_admin/ui_kit/widgets/common_shimmer.dart';
import 'package:dbro_admin/ui_kit/widgets/expandable_widget.dart';
import 'package:dbro_admin/ui_kit/widgets/table_button.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

part 'division_list_page.dart';
part 'component/division_list_tile.dart';

mixin class _Worker {
  final bloc = Get.find<DivisionListBloc>();
}

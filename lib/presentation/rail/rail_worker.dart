import 'package:auto_route/auto_route.dart';
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/ui_kit/state/get_state.dart';
import 'package:dbro_admin/ui_kit/state/get_state_builder.dart';
import 'package:dbro_admin/domain/entity/any/menu.dart';
// import 'package:dbro_admin/presentation/logout/logout_worker.dart';
import 'package:dbro_admin/presentation/rail/bloc/rail_extender.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:dbro_admin/ui_kit/widgets/animated_widget.dart';
import 'package:dbro_admin/ui_kit/widgets/blank_builder.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';
part 'component/rail_parent_tile.dart';
part 'component/rail_child_tile.dart';
part 'rail_drawer.dart';
part 'rail_page.dart';

mixin class _Worker {
  final bloc = Get.find<RailBloc>();

  List<Worker> get workers {
    return [
      ever(bloc.drawerState, (state) {
        if (state == true) {
          bloc.permissionList();
        }
      }),
    ];
  }
}

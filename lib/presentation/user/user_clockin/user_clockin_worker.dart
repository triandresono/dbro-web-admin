import 'package:auto_route/auto_route.dart';
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/domain/entity/clockin/clockin_user_list.dart';
import 'package:dbro_admin/presentation/error/no_permission/no_permission_page.dart';
import 'package:dbro_admin/presentation/user/user_clockin/argument/user_clockin_argument.dart';
import 'package:dbro_admin/presentation/user/user_clockin/bloc/user_clockin_extender.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/entity/bar.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/ui_kit/widgets/animated_children.dart';
import 'package:dbro_admin/ui_kit/widgets/base_appbar.dart';
import 'package:dbro_admin/ui_kit/widgets/base_field_prefix.dart';
import 'package:dbro_admin/ui_kit/widgets/empty_state.dart';
import 'package:dbro_admin/ui_kit/widgets/expanded_row.dart';
import 'package:dbro_admin/ui_kit/widgets/prefix_builder_base_input.dart';
import 'package:dbro_admin/ui_kit/widgets/table_parent.dart';
import 'package:dbro_admin/utils/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dbro_admin/ui_kit/state/get_state.dart';
import 'package:dbro_admin/ui_kit/state/get_state_builder.dart';
import 'package:iconly/iconly.dart';
import 'package:skeletonizer/skeletonizer.dart';
part 'component/user_clockin_table.dart';
part 'user_clockin_page.dart';

mixin class _Worker {
  final bloc = Get.find<UserClockinBloc>();

  List<Worker> get worker {
    return [
      Util.listen<ClockInUserList>(
        listener: bloc.userCase,
        callback: (state) {
          if (state is LoadedCase) {
            final data = state.data ?? ClockInUserList();
            bloc.userNameCo.text = data.userName;
          }
        },
      ),
    ];
  }
}

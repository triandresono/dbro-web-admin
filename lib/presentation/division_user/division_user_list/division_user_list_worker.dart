import 'package:auto_route/auto_route.dart';
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/ui_kit/dialog/confirmation_dialog.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/ui_kit/state/get_state_builder.dart';
import 'package:dbro_admin/utils/utils/util.dart';
import 'package:dbro_admin/domain/entity/division/user_division.dart';
import 'package:dbro_admin/presentation/error/no_parameter/no_parameter_page.dart';
import 'package:dbro_admin/presentation/error/no_permission/no_permission_page.dart';
import 'package:dbro_admin/presentation/division_user/division_user_add/argument/division_user_add_argument.dart';
import 'package:dbro_admin/presentation/division_user/division_user_add/division_user_add_worker.dart';
import 'package:dbro_admin/presentation/division_user/division_user_list/argument/division_user_list_argument.dart';
import 'package:dbro_admin/presentation/division_user/division_user_list/bloc/division_user_list_extender.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/entity/bar.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:dbro_admin/ui_kit/widgets/animated_children.dart';
import 'package:dbro_admin/ui_kit/widgets/base_appbar.dart';
import 'package:dbro_admin/ui_kit/widgets/base_button_icon.dart';
import 'package:dbro_admin/ui_kit/widgets/table_button.dart';
import 'package:dbro_admin/ui_kit/widgets/table_parent.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dbro_admin/ui_kit/state/get_state.dart';
import 'package:iconly/iconly.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'component/division_user_list_table.dart';
part 'division_user_list_page.dart';

mixin class _Worker {
  final bloc = Get.find<DivisionUserListBloc>();

  List<Worker> get worker {
    return [
      Util.listen<StatusResponse>(
        listener: bloc.deleteCase,
        with_loading: true,
        callback: (state) async {
          if (state is ErrorCase) {
            await AppRouter.nav.error(desc: state.failure.message);
            AppRouter.nav.pop();
          } else if (state is LoadedCase) {
            bloc.getUserDivision();
          }
        },
      ),
    ];
  }
}

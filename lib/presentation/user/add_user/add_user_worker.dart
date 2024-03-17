import 'package:auto_route/auto_route.dart';
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/sysconfig/role_dropdown.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_list.dart';
import 'package:dbro_admin/presentation/parameter/sysconfig_dialog/argument/sysconfig_dialog_argument.dart';
import 'package:dbro_admin/presentation/parameter/sysconfig_dialog/sysconfig_dialog_worker.dart';
import 'package:dbro_admin/presentation/role/role_dropdown_dialog/argument/role_dropdown_dialog_argument.dart';
import 'package:dbro_admin/presentation/role/role_dropdown_dialog/role_dropdown_dialog_worker.dart';
import 'package:dbro_admin/presentation/user/add_user/bloc/add_user_extender.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/entity/bar.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/ui_kit/state/get_state.dart';
import 'package:dbro_admin/ui_kit/state/get_state_builder.dart';
import 'package:dbro_admin/ui_kit/widgets/animated_children.dart';
import 'package:dbro_admin/ui_kit/widgets/base_appbar.dart';
import 'package:dbro_admin/ui_kit/widgets/base_button_icon.dart';
import 'package:dbro_admin/ui_kit/widgets/base_container.dart';
import 'package:dbro_admin/ui_kit/widgets/common_flex.dart';
import 'package:dbro_admin/ui_kit/widgets/prefix_builder_base_input.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:dbro_admin/utils/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

part 'add_user_page.dart';

mixin class _Worker {
  final bloc = Get.find<AddUserBloc>();

  List<Worker> get worker {
    return [
      Util.listen<StatusResponse>(
        listener: bloc.registerCase,
        with_loading: true,
        callback: (state) async {
          if (state is ErrorCase) {
            await AppRouter.nav.error(desc: state.failure.message);
            AppRouter.nav.pop();
          } else if (state is LoadedCase) {
            AppRouter.nav.replace(const UserListRoute());
          }
        },
      ),
    ];
  }
}

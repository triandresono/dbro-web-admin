import 'package:auto_route/auto_route.dart';
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/presentation/user/user_verify/bloc/user_verify_extender.dart';
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
import 'package:dbro_admin/ui_kit/widgets/base_field_prefix.dart';
import 'package:dbro_admin/ui_kit/widgets/common_flex.dart';
import 'package:dbro_admin/ui_kit/widgets/prefix_builder_base_input.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:dbro_admin/utils/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

part 'user_verify_page.dart';

mixin class _Worker {
  final bloc = Get.find<UserVerifyBloc>();

  List<Worker> get workers {
    return [
      Util.listen<StatusResponse>(
        listener: bloc.verifyCase,
        callback: (state) {
          if (state is ErrorCase) {
            AppRouter.nav.error(desc: state.failure.text);
          } else if (state is LoadedCase) {
            AppRouter.nav.push(const LoginRoute());
          }
        },
      ),
    ];
  }
}

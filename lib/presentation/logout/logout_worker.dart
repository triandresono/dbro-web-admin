import 'dart:ui';
import 'package:dbro_admin/network/http_logger/logger.dart';
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/ui_kit/state/get_state.dart';
import 'package:dbro_admin/ui_kit/state/get_state_builder.dart';
import 'package:dbro_admin/utils/utils/util.dart';
import 'package:dbro_admin/presentation/logout/bloc/logout_extender.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:dbro_admin/ui_kit/widgets/animated_widget.dart';
import 'package:dbro_admin/ui_kit/widgets/base_button_icon.dart';
import 'package:dbro_admin/ui_kit/widgets/base_loading.dart';
import 'package:dbro_admin/utils/constants/enumeration.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
part 'logout_dialog.dart';

mixin class _Worker {
  final bloc = Get.find<LogoutBloc>();

  List<Worker> get workers {
    return [
      Util.listen(
        listener: bloc.logoutState,
        callback: (state) async {
          if (state is LoadedCase) {
            AppRouter.nav.push(const LoginRoute());
          } else if (state is ErrorCase) {
            Logger.d(state.failure.code);
          }
        },
      ),
    ];
  }
}

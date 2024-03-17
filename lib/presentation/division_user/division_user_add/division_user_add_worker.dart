import 'dart:ui';

import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/presentation/division_user/division_user_add/argument/division_user_add_argument.dart';
import 'package:dbro_admin/presentation/division_user/division_user_add/bloc/division_user_add_extender.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:dbro_admin/ui_kit/widgets/animated_size.dart';
import 'package:dbro_admin/ui_kit/widgets/animated_widget.dart';
import 'package:dbro_admin/ui_kit/widgets/base_button_icon.dart';
import 'package:dbro_admin/ui_kit/widgets/base_dialog_appbar.dart';
import 'package:dbro_admin/ui_kit/widgets/base_loading.dart';
import 'package:dbro_admin/ui_kit/widgets/blank_builder.dart';
import 'package:dbro_admin/ui_kit/widgets/prefix_builder_base_input.dart';
import 'package:dbro_admin/utils/constants/enumeration.dart';
import 'package:dbro_admin/utils/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dbro_admin/ui_kit/state/get_state.dart';
import 'package:dbro_admin/ui_kit/state/get_state_builder.dart';
part 'component/division_user_add_error.dart';
part 'division_user_add_dialog.dart';

mixin class _Worker {
  final bloc = Get.find<DivisionUserAddBloc>();

  List<Worker> get worker {
    return [
      Util.listen<GetId>(
        listener: bloc.createCase,
        callback: (state) {
          if (state is LoadedCase) {
            AppRouter.nav.pop();
          }
        },
      ),
    ];
  }
}

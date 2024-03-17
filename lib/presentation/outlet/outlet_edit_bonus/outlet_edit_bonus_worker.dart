import 'dart:ui';
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/ui_kit/state/get_state.dart';
import 'package:dbro_admin/ui_kit/state/get_state_builder.dart';
import 'package:dbro_admin/presentation/outlet/outlet_edit_bonus/argument/outlet_edit_bonus_argument.dart';
import 'package:dbro_admin/presentation/outlet/outlet_edit_bonus/bloc/outlet_edit_bonus_extender.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:dbro_admin/ui_kit/widgets/animated_widget.dart';
import 'package:dbro_admin/ui_kit/widgets/base_button_icon.dart';
import 'package:dbro_admin/ui_kit/widgets/base_dialog_appbar.dart';
import 'package:dbro_admin/ui_kit/widgets/base_loading.dart';
import 'package:dbro_admin/ui_kit/widgets/dialog_error_state.dart';
import 'package:dbro_admin/ui_kit/widgets/prefix_builder_base_input.dart';
import 'package:dbro_admin/utils/constants/enumeration.dart';
import 'package:dbro_admin/utils/constants/formatter/formatter.dart';
import 'package:dbro_admin/utils/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

part 'outlet_edit_bonus_dialog.dart';

mixin class _Worker {
  final bloc = Get.find<OutletEditBonusBloc>();

  List<Worker> get workers {
    return [
      Util.listen<StatusResponse>(
        listener: bloc.submitCase,
        callback: (state) {
          if (state is LoadedCase) {
            AppRouter.nav.pop(true);
          }
        },
      ),
    ];
  }
}

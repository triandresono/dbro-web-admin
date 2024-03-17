import 'dart:ui';

import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_list.dart';
import 'package:dbro_admin/presentation/outlet/outlet_payroll_calculate/argument/outlet_payroll_calculate_argument.dart';
import 'package:dbro_admin/presentation/outlet/outlet_payroll_calculate/bloc/outlet_payroll_calculate_extender.dart';
import 'package:dbro_admin/presentation/parameter/sysconfig_dialog/argument/sysconfig_dialog_argument.dart';
import 'package:dbro_admin/presentation/parameter/sysconfig_dialog/sysconfig_dialog_worker.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/ui_kit/widgets/animated_widget.dart';
import 'package:dbro_admin/ui_kit/widgets/base_button_icon.dart';
import 'package:dbro_admin/ui_kit/widgets/base_dialog_appbar.dart';
import 'package:dbro_admin/ui_kit/widgets/base_loading.dart';
import 'package:dbro_admin/ui_kit/widgets/dialog_error_state.dart';
import 'package:dbro_admin/ui_kit/widgets/prefix_builder_base_input.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:dbro_admin/utils/constants/enumeration.dart';
import 'package:dbro_admin/utils/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dbro_admin/ui_kit/state/get_state.dart';
import 'package:dbro_admin/ui_kit/state/get_state_builder.dart';
part 'outlet_payroll_calculate_dialog.dart';

mixin class _Worker {
  final bloc = Get.find<OutletPayrollCalculateBloc>();

  List<Worker> get workers {
    return [
      Util.listen<dynamic>(
        listener: bloc.payrollCase,
        callback: (state) {
          if (state is LoadedCase) {
            AppRouter.nav.pop(true);
          }
        },
      ),
    ];
  }
}

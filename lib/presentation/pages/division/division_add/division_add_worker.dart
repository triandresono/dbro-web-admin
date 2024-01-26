import 'dart:ui';
import 'package:dbro_admin/core/state_builder/case.dart';
import 'package:dbro_admin/core/state_builder/get_state.dart';
import 'package:dbro_admin/core/state_builder/get_state_builder.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/presentation/pages/division/division_add/bloc/division_add_extender.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:dbro_admin/ui_kit/widgets/animated_widget.dart';
import 'package:dbro_admin/ui_kit/widgets/base_button_icon.dart';
import 'package:dbro_admin/ui_kit/widgets/base_dialog_appbar.dart';
import 'package:dbro_admin/ui_kit/widgets/base_loading.dart';
import 'package:dbro_admin/ui_kit/widgets/prefix_builder_base_input.dart';
import 'package:dbro_admin/ui_kit/widgets/shared_switch.dart';
import 'package:dbro_admin/utils/constants/enumeration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'division_add_dialog.dart';
part 'component/division_add_error.dart';

mixin class _Worker {
  final bloc = Get.find<DivisionAddBloc>();
}

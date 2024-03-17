import 'package:dbro_admin/presentation/role/role_dropdown_dialog/argument/role_dropdown_dialog_argument.dart';
import 'package:dbro_admin/presentation/role/role_dropdown_dialog/bloc/role_dropdown_dialog_extender.dart';
import 'package:dbro_admin/ui_kit/widgets/dialog_error_state.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/ui_kit/state/get_state.dart';
import 'package:dbro_admin/ui_kit/state/get_state_builder.dart';
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
import 'package:flutter/material.dart';
part 'role_dropdown_dialog.dart';

mixin class _Worker {
  final bloc = Get.find<RoleDropdownDialogBloc>();
}

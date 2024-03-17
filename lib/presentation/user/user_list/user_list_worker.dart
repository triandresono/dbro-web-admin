import 'package:auto_route/auto_route.dart';
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/domain/entity/user/user_all.dart';
import 'package:dbro_admin/presentation/error/no_permission/no_permission_page.dart';
import 'package:dbro_admin/presentation/user/user_list/bloc/user_list_extender.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/entity/bar.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/ui_kit/state/get_state.dart';
import 'package:dbro_admin/ui_kit/state/get_state_builder.dart';
import 'package:dbro_admin/ui_kit/widgets/animated_children.dart';
import 'package:dbro_admin/ui_kit/widgets/base_appbar.dart';
import 'package:dbro_admin/ui_kit/widgets/base_button_icon.dart';
import 'package:dbro_admin/ui_kit/widgets/base_loading.dart';
import 'package:dbro_admin/ui_kit/widgets/blank_builder.dart';
import 'package:dbro_admin/ui_kit/widgets/table_button.dart';
import 'package:dbro_admin/ui_kit/widgets/table_parent.dart';
import 'package:dbro_admin/ui_kit/widgets/web_pagination.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:dbro_admin/utils/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'component/user_list_table.dart';
part 'user_list_page.dart';

mixin class _Worker {
  final bloc = Get.find<UserListBloc>();
}

import 'package:auto_route/auto_route.dart';
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/core/state_builder/case.dart';
import 'package:dbro_admin/core/state_builder/get_state.dart';
import 'package:dbro_admin/core/state_builder/get_state_builder.dart';
import 'package:dbro_admin/core/util/util.dart';
import 'package:dbro_admin/presentation/pages/login/bloc/login_extender.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/generated_theme/assets.gen.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:dbro_admin/ui_kit/widgets/base_button.dart';
import 'package:dbro_admin/ui_kit/widgets/base_field_prefix.dart';
import 'package:dbro_admin/ui_kit/widgets/base_loading.dart';
import 'package:dbro_admin/ui_kit/widgets/hide_widgets.dart';
import 'package:dbro_admin/ui_kit/widgets/prefix_builder_base_input.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
part 'component/login_carousel.dart';
part 'login_page.dart';

mixin class _Worker {
  final bloc = Get.find<LoginBloc>();

  List<Worker> get workers {
    return [
      Util.listen(
        listener: bloc.loginState,
        callback: (state) {
          if (state is ErrorCase) {
            AppRouter.nav.error(
              title: state.failure.code,
              desc: state.failure.message,
            );
          } else if (state is LoadedCase) {
            AppRouter.nav.replace(RailRoute());
          }
        },
      ),
    ];
  }
}

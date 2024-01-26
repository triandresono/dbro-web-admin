import 'package:auto_route/auto_route.dart';
import 'package:dbro_admin/core/state_builder/get_state.dart';
import 'package:dbro_admin/core/state_builder/get_state_builder.dart';
import 'package:dbro_admin/presentation/splash/bloc/splash_bloc.dart';
import 'package:dbro_admin/ui_kit/widgets/base_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  static const page = '/';
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashBloc(Get.find()),
      builder: (controller) => _Body(controller),
    );
  }
}

class _Body extends GetState<SplashBloc> {
  final SplashBloc bloc;
  _Body(this.bloc);

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder(
      container: this,
      context: context,
      init: bloc,
      builder: (controller) {
        return const Center(
          child: BaseLoading(),
        );
      },
    );
  }
}

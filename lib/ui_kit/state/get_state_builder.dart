import 'package:dbro_admin/ui_kit/state/get_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStateBuilder<T extends GetxController> extends GetBuilder<T> {
  GetStateBuilder({
    Key? key,
    T? init,
    isGlobal = false,
    bool autoRemove = true,
    required GetState container,
    required BuildContext context,
    required Widget Function(T) builder,
  }) : super(
          autoRemove: autoRemove,
          didChangeDependencies: container.onDidChangeDependencies,
          didUpdateWidget: container.onDidUpdateWidget,
          dispose: container.onDispose,
          builder: builder,
          global: isGlobal,
          init: init,
          key: key,
          initState: (GetBuilderState<T> controller) {
            container.registerStateEffect(context);
            WidgetsBinding.instance.endOfFrame.then(
              (_) => container.onReady(controller),
            );
          },
        );
}

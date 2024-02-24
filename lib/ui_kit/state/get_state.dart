import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class GetState<T extends GetxController> extends StatelessWidget {
  final List<Worker> disposables = [];

  GetState({Key? key}) : super(key: key);

  void onDispose(GetBuilderState<T> controller) {
    for (var element in disposables) {
      element.dispose();
    }
  }

  void registerStateEffect(BuildContext currentContext) {}

  void onReady(GetBuilderState<T> controller) {}

  void onDidUpdateWidget(
    GetBuilder<GetxController> builder,
    GetBuilderState<T> controller,
  ) {}

  void onDidChangeDependencies(GetBuilderState<T> controller) {}

  void onViewStateChanges(dynamic state, BuildContext context) {}
}

import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/usecase/division_create/division_create_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

part 'division_add_bloc.dart';

mixin class _Extender {
  final nameCo = TextEditingController();
  final createCase = Case<GetId>().obs;
  final isRoot = false.obs;
  final isOutlet = false.obs;
}

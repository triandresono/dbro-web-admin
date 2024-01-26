import 'package:dbro_admin/core/state_builder/case.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/usecase/division_create_usecase/division_create_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

part 'division_add_bloc.dart';

mixin class _Extender {
  final nameCo = TextEditingController();
  final createCase = Case<GetId>().obs;
  final isRoot = false.obs;
}

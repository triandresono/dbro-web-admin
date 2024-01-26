import 'package:dbro_admin/core/state_builder/case.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/usecase/sysconfig_create_usecase/sysconfig_create_usecase.dart';
import 'package:dbro_admin/presentation/pages/parameter/sysconfig_list/argument/sysconfig_list_argument.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'add_sysconfig_bloc.dart';

mixin class _Extender {
  final fieldCo = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final createState = Case<GetId>().obs;
}

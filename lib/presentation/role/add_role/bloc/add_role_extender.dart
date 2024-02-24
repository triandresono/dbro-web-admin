import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_detail.dart';
import 'package:dbro_admin/domain/usecase/sysconfig_create_usecase/sysconfig_create_usecase.dart';
import 'package:dbro_admin/domain/usecase/sysconfig_type_detail_usecase/sysconfig_type_detail_usecase.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
part 'add_role_bloc.dart';

mixin class _Extender {
  final roleCo = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final typeState = Case<SysconfigDetail>().obs;
  final createState = Case<GetId>().obs;
}

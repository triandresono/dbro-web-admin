import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/domain/entity/auth/login.dart';
import 'package:dbro_admin/domain/usecase/local/local_usecase.dart';
import 'package:dbro_admin/domain/usecase/login/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
part 'login_bloc.dart';

mixin class _Extender {
  final emailCo = TextEditingController();
  final passCo = TextEditingController();
  final loginState = Case<Login>().obs;
  final slide = 0.obs;
}

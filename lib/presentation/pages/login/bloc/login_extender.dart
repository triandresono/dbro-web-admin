import 'package:dbro_admin/core/state_builder/case.dart';
import 'package:dbro_admin/domain/entity/auth/login.dart';
import 'package:dbro_admin/domain/usecase/local_usecase/local_usecase.dart';
import 'package:dbro_admin/domain/usecase/login_usecase/login_usecase.dart';
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

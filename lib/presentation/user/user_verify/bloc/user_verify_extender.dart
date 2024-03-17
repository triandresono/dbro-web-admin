import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/usecase/register_verify/register_verify_usecase.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/utils/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'user_verify_bloc.dart';

mixin class _Extender {
  final formKey = GlobalKey<FormState>();
  final passCo = TextEditingController();
  final confirmCo = TextEditingController();
  final verifyCase = Case<StatusResponse>().obs;
  final obscureA = true.obs;
  final obscureB = true.obs;
  final valid = false.obs;

  void _dispose() {
    passCo.dispose();
    confirmCo.dispose();
  }
}

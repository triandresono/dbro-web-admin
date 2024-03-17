// ignore_for_file: unused_element

import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/sysconfig/role_dropdown.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_list.dart';
import 'package:dbro_admin/domain/usecase/register_user/register_user_usecase.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'add_user_bloc.dart';

mixin class _Extender {
  final registerCase = Case<StatusResponse>().obs;
  final valid = false.obs;

  final formKey = GlobalKey<FormState>();
  final emailCo = TextEditingController();
  final nameCo = TextEditingController();
  final joinDateCo = TextEditingController();
  final roleCo = TextEditingController();
  final employmentCo = TextEditingController();
  final birthPlaceCo = TextEditingController();
  final birthDateCo = TextEditingController();
  final genderCo = TextEditingController();
  final maritalCo = TextEditingController();
  final religionCo = TextEditingController();
  final bloodCo = TextEditingController();
  final ktpCo = TextEditingController();
  final npwpCo = TextEditingController();
  final phoneCo = TextEditingController();
  final ktpAddressCo = TextEditingController();
  final domicileAddressCo = TextEditingController();
  final educationCo = TextEditingController();
  final bsiAccountCo = TextEditingController();
  final bpjsCo = TextEditingController();

  RoleDropdownItem? roleVal;
  SysconfigListItem? employmentVal;
  SysconfigListItem? genderVal;
  SysconfigListItem? religionVal;
  SysconfigListItem? maritalStatusVal;
  SysconfigListItem? bloodVal;
  SysconfigListItem? educationVal;

  void _dispose() {
    emailCo.dispose();
    nameCo.dispose();
    joinDateCo.dispose();
    roleCo.dispose();
    employmentCo.dispose();
    birthPlaceCo.dispose();
    birthDateCo.dispose();
    genderCo.dispose();
    maritalCo.dispose();
    religionCo.dispose();
    bloodCo.dispose();
    ktpCo.dispose();
    npwpCo.dispose();
    phoneCo.dispose();
    ktpAddressCo.dispose();
    domicileAddressCo.dispose();
    educationCo.dispose();
    bsiAccountCo.dispose();
    bpjsCo.dispose();
  }
}

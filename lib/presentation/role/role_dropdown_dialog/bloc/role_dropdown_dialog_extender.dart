import 'package:dbro_admin/domain/entity/sysconfig/role_dropdown.dart';
import 'package:dbro_admin/domain/usecase/role_dropdown/role_dropdown_usecase.dart';
import 'package:dbro_admin/presentation/role/role_dropdown_dialog/argument/role_dropdown_dialog_argument.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'role_dropdown_dialog_bloc.dart';

mixin class _Extender {
  Rxn<RoleDropdownItem?> selectedCase = Rxn<RoleDropdownItem?>(null);
  final dropdownCase = Case<RoleDropdown>().obs;
  final searchCo = TextEditingController();
  final searchVal = ''.obs;

  List<RoleDropdownItem> search2(String pattern) {
    final data = dropdownCase.value.data;
    if (data != null) {
      final list = data.list;
      if (pattern.isEmpty) {
        return list;
      } else {
        return list.where(
          (e) {
            final name = e.name;
            return name.toLowerCase().contains(pattern.toLowerCase());
          },
        ).map((e) {
          return RoleDropdownItem(
            roleId: e.roleId,
            name: e.name,
          );
        }).toList();
      }
    } else {
      return [];
    }
  }
}

import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/entity/user/user_dropdown.dart';
import 'package:dbro_admin/domain/usecase/add_user_division/add_user_division_usecase.dart';
import 'package:dbro_admin/domain/usecase/user_dropdown/user_dropdown_usecase.dart';
import 'package:dbro_admin/presentation/division_user/division_user_add/argument/division_user_add_argument.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
part 'division_user_add_bloc.dart';

mixin class _Extender {
  final selectedCase = Rxn<UserDropdownItem?>(null);
  final dropdownCase = Case<UserDropdown>().obs;
  final searchCo = TextEditingController();
  final createCase = Case<GetId>().obs;
  final searchVal = ''.obs;

  List<UserDropdownItem> search2(String pattern) {
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
          return UserDropdownItem(
            id: e.id,
            name: e.name,
          );
        }).toList();
      }
    } else {
      return [];
    }
  }
}

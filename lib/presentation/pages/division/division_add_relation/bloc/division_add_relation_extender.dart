import 'package:dbro_admin/core/state_builder/case.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/entity/division/division_dropdown.dart';
import 'package:dbro_admin/domain/usecase/division_create_relation_usecase/division_create_relation_usecase.dart';
import 'package:dbro_admin/domain/usecase/division_dropdown_usecase/division_dropdown_usecase.dart';
import 'package:dbro_admin/presentation/pages/division/division_add_relation/argument/division_add_relation_argument.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'division_add_relation_bloc.dart';

mixin class _Extender {
  Rxn<DivisionDropdownItem?> selectedCase = Rxn<DivisionDropdownItem?>(null);
  final dropdownCase = Case<DivisionDropdown>().obs;
  final searchCo = TextEditingController();
  final createCase = Case<GetId>().obs;
  final searchVal = ''.obs;

  List<DivisionDropdownItem> search2(String pattern) {
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
          return DivisionDropdownItem(
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

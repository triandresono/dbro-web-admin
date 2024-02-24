// ignore_for_file: unused_element

import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/domain/entity/division/division_list.dart';
import 'package:get/get.dart';

class DivisionListUI {
  final DivisionListItem parent;
  List<DivisionListUI> child;
  Rx<bool> expand = false.obs;
  Rx<Case> actionState = Case().obs;
  int level;

  DivisionListUI({
    DivisionListItem? parent,
    this.child = const [],
    this.level = 0,
  }) : parent = parent ?? DivisionListItem();
}

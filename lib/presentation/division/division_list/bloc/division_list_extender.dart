import 'package:dbro_admin/utils/constants/consts.dart';
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/domain/entity/division/division_list.dart';
import 'package:dbro_admin/domain/usecase/division_child_usecase/division_child_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/division_root_usecase/division_root_usecase.dart';
import 'package:dbro_admin/presentation/division/division_list/model/division_list_ui.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:get/get.dart';
part 'division_list_bloc.dart';

mixin class _Extender {
  final divisions = <DivisionListUI>[].obs;
  final rootCase = Case<DivisionList>().obs;

  int _findLowestLevel(List<DivisionListUI> list) {
    int lowestLevel = 9999;
    for (var item in list) {
      if (item.child.isNotEmpty) {
        int childLowest = _findLowestLevel(item.child);
        if (childLowest < lowestLevel) {
          lowestLevel = childLowest;
        }
      } else {
        if (item.level < lowestLevel) {
          lowestLevel = item.level;
        }
      }
    }
    return lowestLevel;
  }

  void _setLevels(List<DivisionListUI> list) {
    int lowestLevel = _findLowestLevel(list);

    for (var item in list) {
      item.level -= (lowestLevel - 1);
      if (item.child.isNotEmpty) {
        _setLevels(item.child);
      }
    }
  }
}

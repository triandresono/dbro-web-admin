import 'package:dbro_admin/domain/entity/user/user_all.dart';
import 'package:dbro_admin/domain/usecase/all_user/all_user_usecase.dart';
import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:dbro_admin/utils/constants/consts.dart';
import 'package:get/get.dart';

part 'user_list_bloc.dart';

mixin class _Extender {
  final userAllCase = Case<UserAll>().obs;
  final list = <UserAllItem>[].obs;

  final limit = 5;
  final page = 0.obs;
  final total = 0.obs;

  void incrememt(int pages) => page(pages);
  void reset() {
    page(0);
    list.clear();
  }
}

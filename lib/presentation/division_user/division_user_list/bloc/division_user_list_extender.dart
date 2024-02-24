import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/domain/entity/division/user_division.dart';
import 'package:dbro_admin/domain/usecase/user_division_usecase/user_division_usecase.dart';
import 'package:dbro_admin/presentation/division_user/division_user_list/argument/division_user_list_argument.dart';
import 'package:get/get.dart';

part 'division_user_list_bloc.dart';

mixin class _Extender {
  final userCase = Case<UserDivision>().obs;
  final isInit = false.obs;
}

import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/domain/usecase/local_usecase/local_usecase.dart';
import 'package:dbro_admin/domain/usecase/logout_usecase/logout_usecase.dart';
import 'package:get/get.dart';
part 'logout_bloc.dart';

mixin class _Extender {
  final logoutState = Case().obs;
}

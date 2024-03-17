import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/domain/usecase/local/local_usecase.dart';
import 'package:dbro_admin/domain/usecase/logout/logout_usecase.dart';
import 'package:get/get.dart';
part 'logout_bloc.dart';

mixin class _Extender {
  final logoutState = Case().obs;
}

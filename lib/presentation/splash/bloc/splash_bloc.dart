// ignore_for_file: use_build_context_synchronously
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/domain/usecase/local_usecase/local_usecase.dart';
import 'package:get/get.dart';

class SplashBloc extends GetxController {
  final LocalUsecase localUsecase;
  SplashBloc(this.localUsecase);

  @override
  void onInit() async {
    if (localUsecase.get_user.token.isEmpty) {
      AppRouter.nav.replace(const LoginRoute());
    } else {
      AppRouter.nav.replace(const DashboardRoute());
    }
    super.onInit();
  }
}

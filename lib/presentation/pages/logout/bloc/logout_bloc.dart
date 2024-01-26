part of 'logout_extender.dart';

class LogoutBloc extends GetxController with _Extender {
  final LogoutUsecase logoutUsecase;
  final LocalUsecase localUsecase;
  LogoutBloc({
    required this.logoutUsecase,
    required this.localUsecase,
  });

  void logout() async {
    logoutState(LoadingCase());
    final result = await logoutUsecase.logout;
    result.fold(
      (failure) => logoutState(ErrorCase(failure)),
      (result) async {
        await localUsecase.clear();
        logoutState(LoadedCase(result));
      },
    );
  }
}

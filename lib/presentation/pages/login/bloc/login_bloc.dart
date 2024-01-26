part of 'login_extender.dart';

class LoginBloc extends GetxController with _Extender {
  final LoginUsecase usecase;
  final LocalUsecase localUsecase;
  LoginBloc({
    required this.usecase,
    required this.localUsecase,
  });

  @override
  void onClose() {
    emailCo.dispose();
    passCo.dispose();
    super.onClose();
  }

  void login() async {
    loginState(LoadingCase());
    final result = await usecase.login({
      "email": emailCo.text,
      "password": passCo.text,
    });
    result.fold(
      (failure) => loginState(ErrorCase(failure)),
      (result) async {
        await localUsecase.save_secret(emailCo.text);
        await localUsecase.save_user(Login(
          email: emailCo.text,
          token: result.token,
        ));
        loginState(LoadedCase(result));
      },
    );
  }
}

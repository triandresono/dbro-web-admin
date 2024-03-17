part of 'user_verify_extender.dart';

class UserVerifyBloc extends GetxController with _Extender {
  final RegisterVerifyUsecase registerVerifyUsecase;
  UserVerifyBloc({required this.registerVerifyUsecase});

  @override
  void onClose() {
    _dispose();
    super.onClose();
  }

  void verify() async {
    verifyCase(LoadingCase());
    final response = await registerVerifyUsecase.registerVerify({
      "userRegistrationId": Util.rawParameter['userRegistrationId'],
      "password": confirmCo.text,
    });
    response.fold(
      (failure) => verifyCase(ErrorCase(failure)),
      (result) => verifyCase(LoadedCase(result)),
    );
  }
}

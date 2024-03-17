part of 'user_clockin_extender.dart';

class UserClockinBloc extends GetxController with _Extender {
  final ClockinUserlistUsecase usecase;
  final UserClockinArgument argument;
  UserClockinBloc({
    required this.usecase,
    required this.argument,
  });

  @override
  void onInit() {
    getList();
    super.onInit();
  }

  @override
  void onClose() {
    _dispose();
    super.onClose();
  }

  void getList() async {
    userCase(LoadingCase());
    final response = await usecase.userList(argument.id);
    response.fold(
      (failure) {
        if (failure.code.equal(Consts.any.unauthorized)) {
          userCase(UnauthorizedCase());
        } else {
          userCase(ErrorCase(failure));
        }
      },
      (result) => userCase(LoadedCase(result)),
    );
  }
}

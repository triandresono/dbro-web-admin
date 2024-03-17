part of 'outlet_user_list_extender.dart';

class OutletUserListBloc extends GetxController with _Extender {
  final PayrollUserUsecase payrollUserUsecase;
  final PayrollUserListArgument argument;
  OutletUserListBloc({
    required this.payrollUserUsecase,
    required this.argument,
  });

  @override
  void onInit() {
    getUserList();
    super.onInit();
  }

  @override
  void onClose() {
    _dispose();
    super.onClose();
  }

  void getUserList() async {
    userCase(LoadingCase());
    final response = await payrollUserUsecase.payrollUser(argument.id);
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

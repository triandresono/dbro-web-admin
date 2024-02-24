part of 'division_user_list_extender.dart';

class DivisionUserListBloc extends GetxController with _Extender {
  final UserDivisionUsecase userDivisionUsecase;
  final DivisionUserListArgument argument;

  DivisionUserListBloc({
    required this.userDivisionUsecase,
    required this.argument,
  });

  @override
  void onInit() {
    (this).getUserDivision();
    super.onInit();
  }

  void getUserDivision() async {
    userCase(LoadingCase());
    final response = await userDivisionUsecase.userDivision(
      argument.divisionId,
    );
    response.fold(
      (failure) => userCase(ErrorCase(failure)),
      (result) => userCase(LoadedCase(result)),
    );
    if (isInit.value == false) isInit(true);
  }
}

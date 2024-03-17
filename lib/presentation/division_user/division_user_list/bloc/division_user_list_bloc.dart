part of 'division_user_list_extender.dart';

class DivisionUserListBloc extends GetxController with _Extender {
  final UserDivisionUsecase userDivisionUsecase;
  final RemoveUserDivisionUsecase removeUsecase;
  final DivisionUserListArgument argument;
  DivisionUserListBloc({
    required this.userDivisionUsecase,
    required this.removeUsecase,
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

  void removeUser(String id) async {
    deleteCase(LoadingCase());
    final response = await removeUsecase.removeUserDivision({
      "divisionId": argument.divisionId,
      "userAuthId": id,
    });
    response.fold(
      (failure) => deleteCase(ErrorCase(failure)),
      (result) => deleteCase(LoadedCase(result)),
    );
  }
}

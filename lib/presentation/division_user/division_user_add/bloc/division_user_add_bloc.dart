part of 'division_user_add_extender.dart';

class DivisionUserAddBloc extends GetxController with _Extender {
  final UserDropdownUsecase dropdownUsecase;
  final AddUserDivisionUsecase createRelationUsecase;
  final DivisionUserAddArgument argument;
  DivisionUserAddBloc({
    required this.dropdownUsecase,
    required this.createRelationUsecase,
    required this.argument,
  });

  @override
  void onInit() {
    (this).getDropdown();
    super.onInit();
  }

  void getDropdown() async {
    dropdownCase(LoadingCase());
    final response = await dropdownUsecase.userDropdown;
    response.fold(
      (failure) => dropdownCase(ErrorCase(failure)),
      (result) => dropdownCase(LoadedCase(result)),
    );
  }

  void submitCreate() async {
    createCase(LoadingCase());
    final response = await createRelationUsecase.addUserDivision(
      {
        'divisionId': argument.divisionId,
        'userAuthId': selectedCase.value?.id,
      },
    );
    response.fold(
      (failure) => createCase(ErrorCase(failure)),
      (result) => createCase(LoadedCase(result)),
    );
  }
}

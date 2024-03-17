part of 'role_dropdown_dialog_extender.dart';

class RoleDropdownDialogBloc extends GetxController with _Extender {
  final RoleDropdownUsecase dropdownUsecase;
  final RoleDropdownDialogArgument argument;
  RoleDropdownDialogBloc({
    required this.dropdownUsecase,
    required this.argument,
  });

  @override
  void onInit() {
    if (argument.selected != null) {
      selectedCase(argument.selected);
    }
    (this).getDropdown();
    super.onInit();
  }

  void getDropdown() async {
    dropdownCase(LoadingCase());
    final response = await dropdownUsecase.roleDropdown;
    response.fold(
      (failure) => dropdownCase(ErrorCase(failure)),
      (result) => dropdownCase(LoadedCase(result)),
    );
  }
}

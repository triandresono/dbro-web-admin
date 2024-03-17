part of 'division_add_relation_extender.dart';

class DivisionAddRelationBloc extends GetxController with _Extender {
  final DivisionDropdownUsecase dropdownUsecase;
  final DivisionCreateRelationUsecase createRelationUsecase;
  final DivisionAddRelationArgument argument;
  DivisionAddRelationBloc({
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
    final response = await dropdownUsecase.dropdown;
    response.fold(
      (failure) => dropdownCase(ErrorCase(failure)),
      (result) => dropdownCase(LoadedCase(result)),
    );
  }

  void submitCreate() async {
    createCase(LoadingCase());
    final response = await createRelationUsecase.createDivisionStructure(
      {
        'parentDivisionId': argument.id,
        'childDivisionId': selectedCase.value?.id,
      },
    );
    response.fold(
      (failure) => createCase(ErrorCase(failure)),
      (result) => createCase(LoadedCase(result)),
    );
  }
}

part of 'division_add_extender.dart';

class DivisionAddBloc extends GetxController with _Extender {
  final DivisionCreateUsecase createUsecase;
  DivisionAddBloc({required this.createUsecase});

  void createDivision() async {
    createCase(LoadingCase());
    final response = await createUsecase.createDivision({
      'name': nameCo.text,
      'rootFlag': isRoot.value,
      'outletFlag': isOutlet.value,
    });
    response.fold(
      (failure) => createCase(ErrorCase(failure)),
      (result) => createCase(LoadedCase(result)),
    );
  }
}

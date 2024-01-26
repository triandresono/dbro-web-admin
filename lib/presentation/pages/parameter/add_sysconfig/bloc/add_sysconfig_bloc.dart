part of 'add_sysconfig_extender.dart';

class AddSysconfigBloc extends GetxController with _Extender {
  final SysconfigCreateUsecase createUsecase;
  final SysconfigListArgument argument;
  AddSysconfigBloc({
    required this.createUsecase,
    required this.argument,
  });

  @override
  void onClose() {
    fieldCo.dispose();
    super.onClose();
  }

  void submitCreate() async {
    createState(LoadingCase());
    final response = await createUsecase.create({
      "sysconfigTypeId": argument.id,
      "key": fieldCo.text.capsSnakeCase,
      "value": fieldCo.text,
    });
    response.fold(
      (failure) => createState(ErrorCase(failure)),
      (result) => createState(LoadedCase(result)),
    );
  }
}

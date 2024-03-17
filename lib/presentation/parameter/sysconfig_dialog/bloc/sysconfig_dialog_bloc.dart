part of 'sysconfig_dialog_extender.dart';

class SysconfigDialogBloc extends GetxController with _Extender {
  final SysconfigDialogArgument argument;
  final SysconfigListUsecase usecase;
  SysconfigDialogBloc({
    required this.argument,
    required this.usecase,
  });

  @override
  void onInit() {
    (this).getConfig();
    super.onInit();
  }

  void getConfig() async {
    configCase(LoadingCase());
    final response = await usecase.sysconfig_list({
      "type": argument.type,
      "page": 0,
      "size": 100,
    });
    response.fold(
      (failure) => configCase(ErrorCase(failure)),
      (result) => configCase(LoadedCase(result)),
    );
  }
}

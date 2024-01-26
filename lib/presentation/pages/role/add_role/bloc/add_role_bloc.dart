part of 'add_role_extender.dart';

class AddRoleBloc extends GetxController with _Extender {
  final SysconfigTypeDetailUsecase typeDetailUsecase;
  final SysconfigCreateUsecase createUsecase;
  AddRoleBloc({
    required this.typeDetailUsecase,
    required this.createUsecase,
  });

  @override
  void onInit() {
    (this).getDetail();
    super.onInit();
  }

  @override
  void onClose() {
    roleCo.dispose();
    super.onClose();
  }

  void getDetail() async {
    typeState(LoadingCase());
    final response = await typeDetailUsecase.getDetail("ROLE");
    response.fold(
      (failure) => typeState(ErrorCase(failure)),
      (result) => typeState(LoadedCase(result)),
    );
  }

  void submitCreate() async {
    createState(LoadingCase());
    final response = await createUsecase.create({
      "sysconfigTypeId": typeState.value.data?.id,
      "key": roleCo.text.capsSnakeCase,
      "value": roleCo.text,
    });
    response.fold(
      (failure) => createState(ErrorCase(failure)),
      (result) => createState(LoadedCase(result)),
    );
  }
}

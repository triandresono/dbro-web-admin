part of 'sysconfig_type_extender.dart';

class SysconfigTypeBloc extends GetxController with _Extender {
  final SysconfigTypeListUsecase listUsecase;
  SysconfigTypeBloc(this.listUsecase);

  @override
  void onInit() {
    (this).getTypes();
    super.onInit();
  }

  void getTypes() async {
    typeState(LoadingCase());
    final response = await listUsecase.list;
    response.fold(
      (failure) {
        if (failure.code.equal(Consts.any.unauthorized)) {
          typeState(UnauthorizedCase());
        } else {
          typeState(ErrorCase(failure));
        }
      },
      (result) {
        (this).types.rxNew(result.sysconfigTypeDTOs);
        typeState(LoadedCase(result));
      },
    );
  }
}

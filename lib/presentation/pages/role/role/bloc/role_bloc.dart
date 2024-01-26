part of 'role_extender.dart';

class RoleBloc extends GetxController with _Extender {
  final SysconfigListUsecase configUsecase;
  RoleBloc(this.configUsecase);

  @override
  void onInit() {
    (this).sysconfig();
    super.onInit();
  }

  void sysconfig() async {
    roleState(LoadingCase());
    final response = await configUsecase.sysconfig_list(request.toMap());
    response.fold(
      (failure) {
        if (failure.code.equal(Consts.any.unauthorized)) {
          roleState(UnauthorizedCase());
        } else {
          roleState(ErrorCase(failure));
        }
      },
      (result) {
        (this).roles.rxNew(result.dtos);
        totalCount(result.totalCount);
        roleState(LoadedCase(result));
      },
    );
    if (isInit.value == false) isInit(true);
  }
}

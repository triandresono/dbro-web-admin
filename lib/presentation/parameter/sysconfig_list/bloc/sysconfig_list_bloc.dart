part of 'sysconfig_list_extender.dart';

class SysconfigListBloc extends GetxController with _Extender {
  void reset() => request = SysconfigListRequest.init(argument.type);
  final SysconfigListArgument argument;
  final SysconfigListUsecase listUsecase;
  SysconfigListBloc({
    required this.argument,
    required this.listUsecase,
  });

  @override
  void onInit() {
    (this).reset();
    (this).sysconfigList();
    super.onInit();
  }

  void sysconfigList() async {
    listState(LoadingCase());
    final response = await listUsecase.sysconfig_list(request.toMap());
    response.fold(
      (failure) {
        if (failure.code.equal(Consts.any.unauthorized)) {
          listState(UnauthorizedCase());
        } else {
          listState(ErrorCase(failure));
        }
      },
      (result) {
        (this).sysList.rxNew(result.dtos);
        totalCount(result.totalCount);
        listState(LoadedCase(result));
      },
    );
    if (isInit.value == false) isInit(true);
  }
}

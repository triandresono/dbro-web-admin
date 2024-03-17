part of 'outlet_list_extender.dart';

class OutletListBloc extends GetxController with _Extender {
  final OutletListUsecase outletListUsecase;
  OutletListBloc({required this.outletListUsecase});

  @override
  void onInit() {
    (this).getOutletList();
    super.onInit();
  }

  void getOutletList() async {
    listCase(LoadingCase());
    final response = await outletListUsecase.outletList;
    response.fold(
      (failure) {
        if (failure.code.equal(Consts.any.unauthorized)) {
          listCase(UnauthorizedCase());
        } else {
          listCase(ErrorCase(failure));
        }
      },
      (result) {
        listCase(LoadedCase(result));
      },
    );
  }
}

part of 'outlet_user_edit_extender.dart';

class OutletUserEditBloc extends GetxController with _Extender {
  final UserUpdatePayrollUsecase updatePayrollUsecase;
  final OutletUserEditArgument argument;
  OutletUserEditBloc({
    required this.updatePayrollUsecase,
    required this.argument,
  });

  @override
  void onInit() {
    gajiPokokCo.text = argument.gajiPokok.dotSeparator;
    uangMakanCo.text = argument.uangMakan.dotSeparator;
    potonganCo.text = argument.potongan.dotSeparator;
    super.onInit();
  }

  @override
  void onClose() {
    _dispose();
    super.onClose();
  }

  void updatePayroll() async {
    submitCase(LoadingCase());
    final response = await updatePayrollUsecase.updatePayroll({
      'userAuthId': argument.id,
      'gajiPokok': gajiPokokCo.text.amountNum,
      'uangMakan': uangMakanCo.text.amountNum,
      'potonganLainLain': potonganCo.text.amountNum,
    });
    response.fold(
      (failure) => submitCase(ErrorCase(failure)),
      (result) => submitCase(LoadedCase(result)),
    );
  }
}

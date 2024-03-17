part of 'outlet_edit_bonus_extender.dart';

class OutletEditBonusBloc extends GetxController with _Extender {
  final DivisionUpdatePayrollUsecase updateUsecase;
  final OutletEditBonusArgument argument;
  OutletEditBonusBloc({
    required this.updateUsecase,
    required this.argument,
  });

  @override
  void onInit() {
    harianCo.text = argument.bonusHarian.dotSeparator;
    kawakaCo.text = argument.bonusKawaka.dotSeparator;
    super.onInit();
  }

  @override
  void onClose() {
    (this)._dispose();
    super.onClose();
  }

  void submit() async {
    submitCase(LoadingCase());
    final response = await updateUsecase.updateDivisionPayroll({
      'divisionId': argument.id,
      'jumlahBonusHarian': harianCo.text.amountNum,
      'jumlahBonusKawaka': kawakaCo.text.amountNum,
    });
    response.fold(
      (failure) => submitCase(ErrorCase(failure)),
      (result) => submitCase(LoadedCase(result)),
    );
  }
}

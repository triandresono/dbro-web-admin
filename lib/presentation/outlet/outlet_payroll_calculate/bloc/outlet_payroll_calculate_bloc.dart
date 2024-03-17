part of 'outlet_payroll_calculate_extender.dart';

class OutletPayrollCalculateBloc extends GetxController with _Extender {
  final PayrollCalculateUsecase calculateUsecase;
  final OutletPayrollCalculateArgument argument;
  OutletPayrollCalculateBloc({
    required this.calculateUsecase,
    required this.argument,
  });

  @override
  void onClose() {
    _dispose();
    super.onClose();
  }

  void calculate() async {
    payrollCase(LoadingCase());
    final response = await calculateUsecase.calculatePayroll({
      'divisionId': argument.divisionId,
      'periodId': periodVal?.id,
    });
    response.fold(
      (failure) => payrollCase(ErrorCase(failure)),
      (result) => payrollCase(LoadedCase(result)),
    );
  }
}

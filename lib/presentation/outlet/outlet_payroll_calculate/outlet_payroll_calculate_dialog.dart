part of 'outlet_payroll_calculate_worker.dart';

class OutletPayrollCalculateDialog extends StatelessWidget {
  final OutletPayrollCalculateArgument argument;
  const OutletPayrollCalculateDialog({
    super.key,
    required this.argument,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
      child: Dialog(
        backgroundColor: AppColor.appGrayBg,
        surfaceTintColor: AppColor.appGrayBg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: GetBuilder<OutletPayrollCalculateBloc>(
          init: OutletPayrollCalculateBloc(
            calculateUsecase: Get.find(),
            argument: argument,
          ),
          builder: (controller) {
            return SizedBox(
              width: Sizer.fix_width * 0.3,
              child: _Switch(),
            );
          },
        ),
      ),
    );
  }
}

class _Switch extends GetState<OutletPayrollCalculateBloc> with _Worker {
  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(workers);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<OutletPayrollCalculateBloc>(
      container: this,
      context: context,
      init: bloc,
      builder: (controller) {
        return Obx(() {
          final create = bloc.payrollCase.value;
          return SwitcherBuilder(builder: () {
            if (create is LoadingCase) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                height: Sizer.fix_height * 0.2,
                child: const BaseLoading(),
              );
            } else if (create is ErrorCase) {
              return DialogErrorState(
                status: create.failure,
                onReload: () => bloc.payrollCase(Case()),
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BaseDialogAppbar(title: "Calculate Payroll"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: bloc.formKey,
                      onChanged: () {
                        final valid =
                            bloc.formKey.currentState?.validate() ?? false;
                        bloc.valid(valid);
                      },
                      child: _Body(bloc: bloc),
                    ),
                  ),
                ],
              );
            }
          });
        });
      },
    );
  }
}

class _Body extends StatelessWidget {
  final OutletPayrollCalculateBloc bloc;
  const _Body({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        PrefixBaseInput(
          controller: bloc.periodCo,
          hint: 'Payroll Period',
          readonly: true,
          trailing: (color) {
            return Padding(
              padding: const EdgeInsets.only(right: 12, bottom: 5),
              child: RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                  color: color,
                ),
              ),
            );
          },
          onTap: () async {
            final result = await AppRouter.nav.dialog(
              dialog: SysconfigDialog(
                argument: SysconfigDialogArgument(
                  title: "Select Period",
                  selected: bloc.periodVal,
                  type: "PERIOD",
                ),
              ),
            );
            if (result != null && result is SysconfigListItem) {
              bloc.periodCo.text = result.value;
              bloc.periodVal = result;
            }
          },
          validator: (value) {
            final str = value ?? '';
            if (str.isEmpty) {
              return 'This field cannot be empty';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(height: 38),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BaseButtonIcon(
              colorType: ColorType.WHITE,
              title: "Cancel",
              onPressed: () => Navigator.of(context).pop(),
            ),
            const SizedBox(width: 12),
            Obx(() {
              final valid = bloc.valid.value;
              return BaseButtonIcon(
                isFillWidth: false,
                isDisabled: valid == false,
                title: "Download",
                onPressed: () => bloc.calculate(),
              );
            }),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

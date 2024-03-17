part of 'outlet_user_edit_worker.dart';

class OutletUserEditDialog extends StatelessWidget {
  final OutletUserEditArgument argument;
  const OutletUserEditDialog({
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
        child: GetBuilder<OutletUserEditBloc>(
          init: OutletUserEditBloc(
            updatePayrollUsecase: Get.find(),
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

class _Switch extends GetState<OutletUserEditBloc> with _Worker {
  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(workers);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<OutletUserEditBloc>(
      container: this,
      context: context,
      init: bloc,
      builder: (controller) {
        return Obx(() {
          final create = bloc.submitCase.value;
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
                onReload: () => bloc.submitCase(Case()),
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BaseDialogAppbar(title: "Edit Payroll"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _Body(bloc: bloc),
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
  final OutletUserEditBloc bloc;
  const _Body({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        PrefixBaseInput(
          controller: bloc.gajiPokokCo,
          hint: "Gaji Pokok",
          inputType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
            CurrencyInputFormatter(),
          ],
        ),
        const SizedBox(height: 12),
        PrefixBaseInput(
          controller: bloc.uangMakanCo,
          hint: "Uang Makan",
          inputType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
            CurrencyInputFormatter(),
          ],
        ),
        const SizedBox(height: 12),
        PrefixBaseInput(
          controller: bloc.potonganCo,
          hint: "Potongan Lain-lain",
          inputType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
            CurrencyInputFormatter(),
          ],
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
            BaseButtonIcon(
              isFillWidth: false,
              title: "Submit",
              onPressed: () => bloc.updatePayroll(),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

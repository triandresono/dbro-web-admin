part of 'outlet_edit_bonus_worker.dart';

class OutletEditBonusDialog extends StatelessWidget {
  final OutletEditBonusArgument argument;
  const OutletEditBonusDialog({
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
        child: GetBuilder<OutletEditBonusBloc>(
          init: OutletEditBonusBloc(
            updateUsecase: Get.find(),
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

class _Switch extends GetState<OutletEditBonusBloc> with _Worker {
  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(workers);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<OutletEditBonusBloc>(
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
                  const BaseDialogAppbar(title: "Edit Division Payroll"),
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
  final OutletEditBonusBloc bloc;
  const _Body({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        PrefixBaseInput(
          controller: bloc.harianCo,
          hint: "Bonus Harian",
          inputType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
            CurrencyInputFormatter(),
          ],
        ),
        const SizedBox(height: 12),
        PrefixBaseInput(
          controller: bloc.kawakaCo,
          hint: "Bonus Kawaka",
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
              onPressed: () => bloc.submit(),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

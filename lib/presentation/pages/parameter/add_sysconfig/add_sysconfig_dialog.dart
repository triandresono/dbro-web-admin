part of 'add_sysconfig_worker.dart';

class AddSysconfigDialog extends StatelessWidget {
  final SysconfigListArgument argument;
  const AddSysconfigDialog({
    super.key,
    required this.argument,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
      child: Dialog(
        backgroundColor: AppColor.appGrayBg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: GetBuilder<AddSysconfigBloc>(
          init: AddSysconfigBloc(
            createUsecase: Get.find(),
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

class _Switch extends GetState<AddSysconfigBloc> with _Worker {
  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(workers);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder(
      container: this,
      context: context,
      init: bloc,
      builder: (controller) {
        return Obx(() {
          final create = bloc.createState.value;
          return SwitcherBuilder(builder: () {
            if (create is LoadingCase) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                height: Sizer.fix_height * 0.2,
                child: const BaseLoading(),
              );
            } else if (create is ErrorCase) {
              return _Error(
                status: create.failure,
                onReload: () => bloc.createState(Case()),
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BaseDialogAppbar(title: "Add System Config"),
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
  final AddSysconfigBloc bloc;
  const _Body({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        PrefixBaseInput(
          controller: TextEditingController()..text = bloc.argument.type,
          fillColor: AppColor.appGrayBg,
          labelBgColor: AppColor.appGrayBg,
          enable: false,
          hint: "Selected Type",
          leading: (p0) {
            return FieldIconSuffix(
              padding: const EdgeInsets.only(left: 16),
              icon: Icon(
                IconlyLight.setting,
                color: p0,
                size: 17,
              ),
            );
          },
        ),
        const SizedBox(height: 18),
        PrefixBaseInput(
          controller: bloc.fieldCo,
          hint: "System Config",
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
              onPressed: () => bloc.submitCreate(),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

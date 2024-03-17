part of 'sysconfig_dialog_worker.dart';

class SysconfigDialog extends StatelessWidget {
  final SysconfigDialogArgument argument;
  const SysconfigDialog({
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
        child: GetBuilder<SysconfigDialogBloc>(
          init: SysconfigDialogBloc(
            argument: argument,
            usecase: Get.find(),
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

class _Switch extends GetState<SysconfigDialogBloc> with _Worker {
  @override
  Widget build(BuildContext context) {
    return GetStateBuilder(
      container: this,
      context: context,
      init: bloc,
      builder: (controller) {
        return Obx(() {
          final dropdown = bloc.configCase.value;
          return SwitcherBuilder(builder: () {
            if (dropdown is LoadingCase) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                height: Sizer.fix_height * 0.2,
                child: const BaseLoading(),
              );
            } else if (dropdown is ErrorCase) {
              return _Error(
                status: dropdown.failure,
                onReload: () => bloc.getConfig(),
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BaseDialogAppbar(title: bloc.argument.title),
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
  final SysconfigDialogBloc bloc;
  const _Body({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Obx(() {
          final selected = bloc.selected.value;
          final state = bloc.configCase.value;
          final data = state.data ?? SysconfigList();
          return AnimatedSwitcherSize(
            sizeDuration: const Duration(milliseconds: 200),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: SingleChildScrollView(
                child: Column(
                  children: data.dtos.asMap().entries.map((e) {
                    return InkWell(
                      onTap: () {
                        if (bloc.selected.value != null) {
                          final data = bloc.selected.value;
                          if (data?.id == e.value.id) {
                            bloc.selected.value = null;
                          } else {
                            bloc.selected(e.value);
                          }
                        } else {
                          bloc.selected(e.value);
                        }
                      },
                      child: Row(children: [
                        Expanded(
                          child: ListTile(
                            mouseCursor: MouseCursor.defer,
                            contentPadding: const EdgeInsets.only(
                              left: 4,
                              right: 8,
                            ),
                            trailing: IgnorePointer(
                              child: BlankBuilder(() {
                                final v = selected != null ? selected.id : '';
                                return Radio<String>(
                                  value: e.value.id,
                                  groupValue: v,
                                  onChanged: (val) {},
                                  activeColor: AppColor.projectPrimary,
                                );
                              }),
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                e.value.value,
                                style: Font.fix(15).regular(),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        }),
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
              onPressed: () => Navigator.of(context).pop(
                bloc.selected.value,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

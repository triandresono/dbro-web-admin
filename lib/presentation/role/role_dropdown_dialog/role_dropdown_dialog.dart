part of 'role_dropdown_dialog_worker.dart';

class RoleDropdownDialog extends StatelessWidget {
  final RoleDropdownDialogArgument argument;
  const RoleDropdownDialog({
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
        child: GetBuilder<RoleDropdownDialogBloc>(
          init: RoleDropdownDialogBloc(
            dropdownUsecase: Get.find(),
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

class _Switch extends GetState<RoleDropdownDialogBloc> with _Worker {
  @override
  Widget build(BuildContext context) {
    return GetStateBuilder(
      container: this,
      context: context,
      init: bloc,
      builder: (controller) {
        return Obx(() {
          final dropdown = bloc.dropdownCase.value;
          return SwitcherBuilder(builder: () {
            if (dropdown is LoadingCase) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                height: Sizer.fix_height * 0.2,
                child: const BaseLoading(),
              );
            } else if (dropdown is ErrorCase) {
              return DialogErrorState(
                status: dropdown.failure,
                onReload: () => bloc.getDropdown(),
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BaseDialogAppbar(
                    title: bloc.argument.title,
                  ),
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
  final RoleDropdownDialogBloc bloc;
  const _Body({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        PrefixBaseInput(
          controller: bloc.searchCo,
          hint: "Search",
          onTextChanged: (val) => bloc.searchVal(val),
        ),
        const SizedBox(height: 12),
        Obx(() {
          final search = bloc.searchVal.value;
          final list = bloc.search2(search);
          final selected = bloc.selectedCase.value;
          return AnimatedSwitcherSize(
            sizeDuration: const Duration(milliseconds: 200),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: SingleChildScrollView(
                child: Column(
                  children: list.asMap().entries.map((e) {
                    return InkWell(
                      onTap: () {
                        if (bloc.selectedCase.value != null) {
                          final data = bloc.selectedCase.value;
                          if (data?.roleId == e.value.roleId) {
                            bloc.selectedCase.value = null;
                          } else {
                            bloc.selectedCase(e.value);
                          }
                        } else {
                          bloc.selectedCase(e.value);
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
                                final v =
                                    selected != null ? selected.roleId : '';
                                return Radio<String>(
                                  value: e.value.roleId,
                                  groupValue: v,
                                  onChanged: (val) {},
                                  activeColor: AppColor.projectPrimary,
                                );
                              }),
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                e.value.name,
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
                bloc.selectedCase.value,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

// ignore_for_file: avoid_function_literals_in_foreach_calls

part of 'division_add_relation_worker.dart';

class DivisionAddRelationDilalog extends StatelessWidget {
  final DivisionAddRelationArgument argument;
  const DivisionAddRelationDilalog({
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
        child: GetBuilder<DivisionAddRelationBloc>(
          init: DivisionAddRelationBloc(
            dropdownUsecase: Get.find(),
            createRelationUsecase: Get.find(),
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

class _Switch extends GetState<DivisionAddRelationBloc> with _Worker {
  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(worker);
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
          final create = bloc.createCase.value;
          final dropdown = bloc.dropdownCase.value;
          return SwitcherBuilder(builder: () {
            if ([create, dropdown].any((e) => e is LoadingCase)) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                height: Sizer.fix_height * 0.2,
                child: const BaseLoading(),
              );
            } else if (create is ErrorCase) {
              return _Error(
                status: create.failure,
                onReload: () => bloc.createCase(Case()),
              );
            } else if (dropdown is ErrorCase) {
              return _Error(
                status: create.failure,
                onReload: () => bloc.getDropdown(),
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BaseDialogAppbar(title: "Add Relation"),
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
  final DivisionAddRelationBloc bloc;
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
                          if (data?.id == e.value.id) {
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
              onPressed: () => bloc.submitCreate(),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

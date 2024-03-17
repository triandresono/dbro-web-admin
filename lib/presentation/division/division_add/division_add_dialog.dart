part of 'division_add_worker.dart';

class DivisionAddDilalog extends StatelessWidget {
  const DivisionAddDilalog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
      child: Dialog(
        backgroundColor: AppColor.appGrayBg,
        surfaceTintColor: AppColor.appGrayBg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: GetBuilder<DivisionAddBloc>(
          init: DivisionAddBloc(
            createUsecase: Get.find(),
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

class _Switch extends GetState<DivisionAddBloc> with _Worker {
  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(workers);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<DivisionAddBloc>(
      container: this,
      context: context,
      init: bloc,
      builder: (controller) {
        return Obx(() {
          final create = bloc.createCase.value;
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
                onReload: () => bloc.createCase(Case()),
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BaseDialogAppbar(title: "Add Division"),
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
  final DivisionAddBloc bloc;
  const _Body({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        PrefixBaseInput(
          controller: bloc.nameCo,
          hint: "Division",
        ),
        const SizedBox(height: 12),
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            if (bloc.isRoot.isTrue) {
              bloc.isRoot(false);
            } else {
              bloc.isRoot(true);
            }
          },
          child: Card(
            elevation: 1,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Is root",
                    style: Font.fix(15).regular(
                      color: AppColor.headerTile,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Obx(() {
                    final yes = bloc.isRoot.value;
                    return SharedSwitch(
                      onToggle: (val) => bloc.isRoot(val),
                      toggleSize: 19,
                      padding: 2,
                      height: 19,
                      width: 35,
                      activeColor: AppColor.projectPrimary,
                      inactiveColor: AppColor.greyField.withOpacity(0.4),
                      value: yes,
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            if (bloc.isOutlet.isTrue) {
              bloc.isOutlet(false);
            } else {
              bloc.isOutlet(true);
            }
          },
          child: Card(
            elevation: 1,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Is Outlet",
                    style: Font.fix(15).regular(
                      color: AppColor.headerTile,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Obx(() {
                    final yes = bloc.isOutlet.value;
                    return SharedSwitch(
                      onToggle: (val) => bloc.isOutlet(val),
                      toggleSize: 19,
                      padding: 2,
                      height: 19,
                      width: 35,
                      activeColor: AppColor.projectPrimary,
                      inactiveColor: AppColor.greyField.withOpacity(0.4),
                      value: yes,
                    );
                  }),
                ],
              ),
            ),
          ),
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
              onPressed: () => bloc.createDivision(),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

part of 'logout_worker.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
      child: Dialog(
        insetPadding: const EdgeInsets.all(20),
        backgroundColor: AppColor.appGrayBg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: GetBuilder<LogoutBloc>(
          init: LogoutBloc(
            localUsecase: Get.find(),
            logoutUsecase: Get.find(),
          ),
          builder: (controller) {
            return SizedBox(
              width: Sizer.fix_width * 0.2,
              child: _Body(),
            );
          },
        ),
      ),
    );
  }
}

class _Body extends GetState<LogoutBloc> with _Worker {
  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(workers);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<LogoutBloc>(
      init: bloc,
      container: this,
      context: context,
      builder: (controller) {
        return Obx(() {
          final state = bloc.logoutState.value;
          return SwitcherBuilder(builder: () {
            if (state is LoadingCase) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                height: Sizer.fix_height * 0.2,
                child: const BaseLoading(),
              );
            } else if (state is ErrorCase) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        state.failure.message,
                        textAlign: TextAlign.center,
                        style: Font.fix(16).regular(
                          color: AppColor.headerTile,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: BaseButtonIcon(
                            title: "Reload",
                            onPressed: () => bloc.logoutState(Case()),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 16),
                  Icon(
                    FeatherIcons.helpCircle,
                    color: AppColor.mainOrange,
                    size: Sizer.fix_height * 0.07,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Logout",
                    style: Font.fix(24).bold(
                      color: AppColor.headerTile,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Are you sure want to logout?",
                    style: Font.fix(16).regular(
                      color: AppColor.headerTile,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BaseButtonIcon(
                        colorType: ColorType.WHITE,
                        title: "Cancel",
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const SizedBox(width: 12),
                      BaseButtonIcon(
                        title: "OK",
                        onPressed: () => bloc.logout(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              );
            }
          });
        });
      },
    );
  }
}

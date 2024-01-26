// ignore_for_file: avoid_function_literals_in_foreach_calls

part of 'rail_worker.dart';

@RoutePage()
class RailPage extends GetState<RailBloc> with _Worker {
  static const path = "/app";
  RailPage({super.key});

  @override
  void registerStateEffect(BuildContext currentContext) {
    disposables.addAll(workers);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder(
      container: this,
      init: bloc,
      context: context,
      builder: (controller) {
        return Scaffold(
          // appBar: AppBar(
          //   elevation: 4,
          //   backgroundColor: Colors.white,
          //   shadowColor: Colors.grey.withOpacity(0.2),
          //   title: Row(
          //     children: [
          //       Assets.image.png.dbroTemporaryLogo.image(
          //         height: 65,
          //         width: 65,
          //         fit: BoxFit.contain,
          //       ),
          //     ],
          //   ),
          // ),
          body: Obx(() {
            final isopen = bloc.drawerState.value;
            final isdesktop = context.deviceType == DeviceScreenType.desktop;
            return Row(
              children: [
                SwitcherBuilder(
                  fadeDuration: const Duration(milliseconds: 200),
                  sizeDuration: const Duration(milliseconds: 200),
                  builder: () {
                    if (isdesktop && isopen) {
                      return Container(
                        color: AppColor.appGrayBg,
                        width: Sizer.fix_width * 0.15,
                        padding: const EdgeInsets.all(10).copyWith(right: 15),
                        child: Drawer(
                          elevation: 10,
                          shadowColor: AppColor.greyField.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            // borderRadius: BorderRadius.only(
                            //   bottomRight: Radius.circular(8),
                            // ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.white,
                          surfaceTintColor: Colors.white,
                          child: _DrawerBody(bloc: bloc),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                const Expanded(child: AutoRouter()),
              ],
            );
          }),
        );
      },
    );
  }
}

class _DrawerBody extends StatelessWidget {
  final RailBloc bloc;
  const _DrawerBody({
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Obx(() {
            final state = bloc.permissionState.value;
            return Skeletonizer(
              enabled: state is LoadingCase,
              ignoreContainers: true,
              ignorePointers: true,
              child: Column(
                children: bloc.menus.map((element) {
                  if (element.menus.isEmpty) {
                    return Skeleton.leaf(
                      child: _ParentTile(
                        icon: element.icon,
                        menu: element,
                        onTap: (menu) {
                          AppRouter.nav.replace(menu.route);
                        },
                      ),
                    );
                  } else {
                    return Skeleton.leaf(
                      child: _ParentTile(
                        icon: element.icon,
                        menu: element,
                        onTap: (menu) {
                          if (menu.expanded.value) {
                            menu.expanded(false);
                          } else {
                            bloc.menus.forEach((e) => e.expanded(false));
                            menu.expanded(true);
                          }
                        },
                        children: element.menus.map((item) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: 6,
                              left: 8,
                            ),
                            child: Skeleton.leaf(
                              child: _ChildTile(
                                onTap: () {
                                  AppRouter.nav.replace(item.route);
                                },
                                menu: item,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                }).toList(),
              ),
            );
          }),
        ),
        // const Spacer(),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: _ParentTile(
        //     icon: IconlyLight.logout,
        //     menu: Menu(menuName: "Logout")..selected(true),
        //     onTap: (menu) async {
        //       AppRouter.nav.dialog(dialog: const LogoutDialog());
        //     },
        //   ),
        // ),
      ],
    );
  }
}

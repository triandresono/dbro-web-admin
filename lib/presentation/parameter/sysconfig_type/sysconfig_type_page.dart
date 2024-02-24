part of 'sysconfig_type_worker.dart';

@RoutePage()
class SysconfigTypePage extends StatelessWidget {
  static const path = 'parameter';
  const SysconfigTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Util.drawer(context),
      backgroundColor: AppColor.appGrayBg,
      appBar: BaseAppbar(
        title: 'Parameter',
        menu: [
          Bar(
            title: 'Manage System Type',
            color: AppColor.projectPrimary,
          ),
        ],
      ),
      body: GetBuilder(
        init: SysconfigTypeBloc(Get.find()),
        builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: _Body(),
          );
        },
      ),
    );
  }
}

class _Body extends GetState<SysconfigTypeBloc> with _Worker {
  @override
  Widget build(BuildContext context) {
    return GetStateBuilder(
      init: bloc,
      container: this,
      context: context,
      builder: (controller) {
        return AnimatedColumn(
          children: [
            const SizedBox(height: 24),
            NoPermissionPage(
              cases: [controller.typeState],
              height: Sizer.fix_height * 0.3,
              child: Obx(() {
                final state = bloc.typeState.value;
                return Skeletonizer(
                  enabled: state is LoadingCase,
                  child: Skeleton.leaf(
                    child: _Table(list: bloc.types),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}

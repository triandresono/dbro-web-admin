part of 'division_list_worker.dart';

@RoutePage()
class DivisionListPage extends StatelessWidget {
  static const path = 'division';
  const DivisionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Util.drawer(context),
      backgroundColor: AppColor.appGrayBg,
      appBar: BaseAppbar(
        title: 'Division',
        menu: [
          Bar(
            title: 'Manage Division',
            color: AppColor.projectPrimary,
          ),
        ],
      ),
      body: GetBuilder(
        init: DivisionListBloc(
          childUsecase: Get.find(),
          rootUsecase: Get.find(),
        ),
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

class _Body extends GetState<DivisionListBloc> with _Worker {
  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<DivisionListBloc>(
      container: this,
      context: context,
      init: bloc,
      builder: (controller) {
        return AnimatedColumn(
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                BaseButtonIcon(
                  title: "Add Division",
                  icon: Icons.add,
                  onPressed: () async {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return const DivisionAddDilalog();
                      },
                    ).then((_) => bloc.getRootList());
                  },
                ),
              ],
            ),
            const SizedBox(height: 34),
            Obx(() {
              final rootState = bloc.rootCase.value;
              final list = bloc.divisions;
              if (rootState is LoadingCase) {
                return const Center(child: BaseLoading());
              } else {
                return AnimatedColumn(
                  children: list.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: _Tile(
                        bloc: bloc,
                        item: e,
                      ),
                    );
                  }).toList(),
                );
              }
            }),
            const SizedBox(height: 34),
          ],
        );
      },
    );
  }
}

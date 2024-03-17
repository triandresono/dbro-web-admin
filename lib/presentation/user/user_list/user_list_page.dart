part of 'user_list_worker.dart';

@RoutePage()
class UserListPage extends StatelessWidget {
  static const path = 'user';
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Util.drawer(context),
      backgroundColor: AppColor.appGrayBg,
      appBar: BaseAppbar(
        title: 'User',
        menu: [
          Bar(
            title: 'Manage User',
            color: AppColor.projectPrimary,
          ),
        ],
      ),
      body: GetBuilder(
        init: UserListBloc(allUserUsecase: Get.find()),
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

class _Body extends GetState<UserListBloc> with _Worker {
  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<UserListBloc>(
      container: this,
      context: context,
      init: bloc,
      builder: (_) {
        return AnimatedColumn(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                BaseButtonIcon(
                  title: "Add User",
                  icon: Icons.add,
                  onPressed: () async {
                    AppRouter.nav.replace(const AddUserRoute());
                    // AppRouter.nav.replace(const UserVerifyRoute());
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            Obx(() {
              final state = bloc.userAllCase.value;
              if (state is InitLoadingCase) {
                return const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Center(
                    child: BaseLoading(),
                  ),
                );
              } else {
                return Column(children: [
                  NoPermissionPage(
                    cases: [bloc.userAllCase],
                    height: Sizer.fix_height * 0.3,
                    child: BlankBuilder(() {
                      final data = state is LoadingCase
                          ? UserAll.dummy().userListingResultSets
                          : bloc.list;
                      return _Table(
                        isLoading: state is LoadingCase,
                        list: data,
                      );
                    }),
                  ),
                  const SizedBox(height: 24),
                  Obx(() {
                    final count = bloc.total.value;
                    final total = (count / bloc.limit).ceil();
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Card(
                          elevation: 8.0,
                          shadowColor: Colors.grey.withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: Colors.white70,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: WebPagination(
                              currentPage: bloc.page.value + 1,
                              displayItemCount: bloc.limit,
                              totalPage: total,
                              onPageChanged: (page) {
                                bloc.fetchAllUser(
                                  isInit: false,
                                  pages: page - 1,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(height: 24),
                ]);
              }
            }),
          ],
        );
      },
    );
  }
}

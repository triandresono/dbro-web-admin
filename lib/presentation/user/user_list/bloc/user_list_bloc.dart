part of 'user_list_extender.dart';

class UserListBloc extends GetxController with _Extender {
  final AllUserUsecase allUserUsecase;
  UserListBloc({required this.allUserUsecase});

  @override
  void onInit() {
    fetchAllUser(isInit: true);
    super.onInit();
  }

  void fetchAllUser({
    bool isInit = true,
    int pages = 0,
  }) async {
    if (isInit) {
      userAllCase(InitLoadingCase());
      reset();
    } else {
      userAllCase(LoadingCase());
      incrememt(pages);
    }

    final response = await allUserUsecase.userAll({
      "page": page.value,
      "size": limit,
    });
    response.fold(
      (failure) {
        if (failure.code.equal(Consts.any.unauthorized)) {
          userAllCase(UnauthorizedCase());
        } else {
          userAllCase(ErrorCase(failure));
        }
      },
      (result) {
        (this).list.rxNew(result.userListingResultSets);
        total(result.totalCount);
        userAllCase(LoadedCase(result));
      },
    );
  }
}

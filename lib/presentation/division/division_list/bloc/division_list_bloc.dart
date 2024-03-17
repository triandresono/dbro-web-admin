// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
part of 'division_list_extender.dart';

class DivisionListBloc extends GetxController with _Extender {
  final DivisionRootUsecase rootUsecase;
  final DivisionChildUsecase childUsecase;
  DivisionListBloc({
    required this.rootUsecase,
    required this.childUsecase,
  });

  @override
  void onInit() {
    (this).getRootList();
    super.onInit();
  }

  void getRootList() async {
    rootCase(LoadingCase());
    final response = await rootUsecase.rootList;
    response.fold(
      (failure) {
        if (failure.code.equal(Consts.any.unauthorized)) {
          rootCase(UnauthorizedCase());
        } else {
          rootCase(ErrorCase(failure));
        }
      },
      (result) {
        divisions.rxNew(result.divisionListingDTOs.map((element) {
          return DivisionListUI(
            parent: element,
          );
        }).toList());
        rootCase(LoadedCase(result));
      },
    );
  }

  void getChildList(DivisionListUI item) async {
    item.actionState(LoadingCase());
    final response = await childUsecase.childList(item.parent.id);
    response.fold(
      (failure) async {
        await AppRouter.nav.error(desc: failure.message);
        item.actionState(ErrorCase(failure));
      },
      (result) {
        item.child = result.divisionListingDTOs.map((element) {
          return DivisionListUI(
            parent: element,
          );
        }).toList();
        _setLevels(item.child);
        item.expand(true);
        item.actionState(LoadedCase(result));
      },
    );
  }
}

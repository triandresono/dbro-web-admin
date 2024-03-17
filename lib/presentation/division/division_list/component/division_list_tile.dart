part of '../division_list_worker.dart';

class _Tile extends StatelessWidget {
  final DivisionListUI item;
  final DivisionListBloc bloc;
  const _Tile({
    required this.item,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final state = item.actionState.value;
      final expand = item.expand.value;
      return Column(children: [
        CommonShimmer(
          isLoading: state is LoadingCase,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Card(
                    elevation: 4,
                    shadowColor: AppColor.greyField.withOpacity(0.5),
                    child: ListTile(
                      contentPadding: const EdgeInsets.only(
                        left: 16,
                        right: 12,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 15,
                          top: 4,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.parent.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Font.fix(16).medium(
                                    color: AppColor.headerTile,
                                  ),
                                ),
                                Row(children: [
                                  TableButton(
                                    onTap: () {
                                      AppRouter.nav.pushParemeter(
                                        const DivisionUserListRoute(),
                                        encrypt: false,
                                        parameter: {
                                          "divisionId": item.parent.id,
                                        },
                                      );
                                    },
                                    tips: "User",
                                    icon: IconlyLight.user,
                                    color: AppColor.headerTile,
                                  ),
                                  const SizedBox(width: 12),
                                  TableButton(
                                    onTap: () {},
                                    tips: "Edit Division",
                                    icon: IconlyLight.edit_square,
                                    color: AppColor.headerTile,
                                  ),
                                  const SizedBox(width: 12),
                                  TableButton(
                                    tips: "Add Relation",
                                    icon: IconlyLight.plus,
                                    color: AppColor.headerTile,
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) {
                                          return DivisionAddRelationDilalog(
                                            argument:
                                                DivisionAddRelationArgument(
                                              id: item.parent.id,
                                            ),
                                          );
                                        },
                                      ).then((_) => bloc.getChildList(item));
                                    },
                                  ),
                                  if (item.level > 0) ...[
                                    const SizedBox(width: 12),
                                    TableButton(
                                      onTap: () {
                                        //TODO
                                      },
                                      tips: "Remove Relation",
                                      icon: IconlyLight.delete,
                                      color: AppColor.headerTile,
                                    ),
                                  ],
                                ]),
                              ],
                            ),
                            Text(
                              '${item.parent.createdBy} • ${item.parent.createdDate}',
                              style: Font.fix(13).light(
                                color: AppColor.headerTile,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    if (item.expand.isFalse) {
                      bloc.getChildList(item);
                    } else {
                      item.expand(false);
                    }
                  },
                  child: Card(
                    elevation: 4,
                    shadowColor: AppColor.greyField.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FadeSwitcherBuilder(builder: () {
                        if (expand == true) {
                          return const RotatedBox(
                            quarterTurns: 3,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColor.headerTile,
                              size: 17,
                            ),
                          );
                        } else {
                          return const RotatedBox(
                            quarterTurns: 1,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColor.headerTile,
                              size: 17,
                            ),
                          );
                        }
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ExpandableWidget(
          expand: expand,
          child: Column(children: [
            const SizedBox(height: 10),
            BlankBuilder(() {
              if (item.child.isEmpty) {
                return const BaseContainer(
                  child: Text("KOSONG"),
                );
              } else {
                return AnimatedColumn(
                  children: item.child.map((e) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: 7,
                        left: (e.level * 30),
                      ),
                      child: _Tile(
                        bloc: bloc,
                        item: e,
                      ),
                    );
                  }).toList(),
                );
              }
            }),
          ]),
        ),
      ]);
    });
  }
}

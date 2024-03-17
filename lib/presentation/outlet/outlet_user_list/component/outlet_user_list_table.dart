part of '../outlet_user_list_worker.dart';

class _Table extends StatelessWidget {
  final List<PayrollUserListItem> list;
  final OutletUserListBloc bloc;
  final bool isLoading;
  const _Table({
    required this.list,
    required this.bloc,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollableTableParent(
      width: 1600,
      child: Card(
        elevation: 8.0,
        shadowColor: Colors.grey.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PrefixBaseInput(
                controller: bloc.divisionCo,
                fillColor: Colors.white,
                labelBgColor: Colors.white,
                enable: false,
                hint: "Division",
                leading: (p0) {
                  return FieldIconSuffix(
                    padding: const EdgeInsets.only(left: 16),
                    icon: Icon(
                      IconlyLight.setting,
                      color: p0,
                      size: 17,
                    ),
                  );
                },
              ),
            ),
            ExpandedRow(
              child: BlankBuilder(() {
                if (list.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 50),
                      child: Icon(
                        IconlyLight.search,
                        color: AppColor.headerTile,
                        size: 50,
                      ),
                    ),
                  );
                } else {
                  return DataTable(
                    columns: <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Name',
                          style: Font.fix(14).semiBold(
                            color: AppColor.headerTile,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Gaji Pokok',
                          style: Font.fix(14).semiBold(
                            color: AppColor.headerTile,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Uang Makan',
                          style: Font.fix(14).semiBold(
                            color: AppColor.headerTile,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Potongan',
                          style: Font.fix(14).semiBold(
                            color: AppColor.headerTile,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Join Date',
                          style: Font.fix(14).semiBold(
                            color: AppColor.headerTile,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Action',
                          style: Font.fix(14).semiBold(
                            color: AppColor.headerTile,
                          ),
                        ),
                      ),
                    ],
                    rows: list.map(
                      (item) {
                        return DataRow(
                          cells: [
                            DataCell(
                              Skeletonizer(
                                enabled: isLoading,
                                child: Text(
                                  item.userName,
                                  style: Font.fix(13).semiBold(
                                    color: AppColor.headerTile,
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Skeletonizer(
                                enabled: isLoading,
                                child: Text(
                                  item.gajiPokok.dotSeparator,
                                  style: Font.fix(13).semiBold(
                                    color: AppColor.headerTile,
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Skeletonizer(
                                enabled: isLoading,
                                child: Text(
                                  item.uangMakan.dotSeparator,
                                  style: Font.fix(13).semiBold(
                                    color: AppColor.headerTile,
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Skeletonizer(
                                enabled: isLoading,
                                child: Text(
                                  item.potonganLainLain.dotSeparator,
                                  style: Font.fix(13).semiBold(
                                    color: AppColor.headerTile,
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Skeletonizer(
                                enabled: isLoading,
                                child: Text(
                                  item.joinDate,
                                  style: Font.fix(13).semiBold(
                                    color: AppColor.headerTile,
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: TableButton(
                                  tips: 'Edit Payroll',
                                  icon: IconlyLight.edit_square,
                                  onTap: () async {
                                    final result = await AppRouter.nav.dialog(
                                      dialog: OutletUserEditDialog(
                                        argument: OutletUserEditArgument(
                                          gajiPokok: item.gajiPokok,
                                          uangMakan: item.uangMakan,
                                          potongan: item.potonganLainLain,
                                          id: item.userAuthId,
                                        ),
                                      ),
                                    );
                                    if (result == true) {
                                      bloc.getUserList();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

part of '../outlet_list_worker.dart';

class _Table extends StatelessWidget {
  final List<OutletPayrollListItem> list;
  final VoidCallback onRefresh;
  const _Table({required this.list, required this.onRefresh});

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
        child: DataTable(
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
                'Bonus Harian',
                style: Font.fix(14).semiBold(
                  color: AppColor.headerTile,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Bonus Kawaka',
                style: Font.fix(14).semiBold(
                  color: AppColor.headerTile,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Created By',
                style: Font.fix(14).semiBold(
                  color: AppColor.headerTile,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Created Date',
                style: Font.fix(14).semiBold(
                  color: AppColor.headerTile,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Modified By',
                style: Font.fix(14).semiBold(
                  color: AppColor.headerTile,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Modified Date',
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
                    Text(
                      item.name,
                      style: Font.fix(13).semiBold(
                        color: AppColor.headerTile,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item.jumlahBonusHarian.dotSeparator,
                      style: Font.fix(13).semiBold(
                        color: AppColor.headerTile,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item.jumlahBonusKawaka.dotSeparator,
                      style: Font.fix(13).semiBold(
                        color: AppColor.headerTile,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item.createdBy,
                      style: Font.fix(13).semiBold(
                        color: AppColor.headerTile,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item.createdDate,
                      style: Font.fix(13).semiBold(
                        color: AppColor.headerTile,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item.lastModifiedBy,
                      style: Font.fix(13).semiBold(
                        color: AppColor.headerTile,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item.lastModifiedDate,
                      style: Font.fix(13).semiBold(
                        color: AppColor.headerTile,
                      ),
                    ),
                  ),
                  DataCell(
                    Row(
                      children: [
                        TableButton(
                          tips: 'Edit Bonus',
                          icon: IconlyLight.edit_square,
                          onTap: () async {
                            final result = await AppRouter.nav.dialog(
                              dialog: OutletEditBonusDialog(
                                argument: OutletEditBonusArgument(
                                  bonusHarian: item.jumlahBonusHarian,
                                  bonusKawaka: item.jumlahBonusKawaka,
                                  id: item.id,
                                ),
                              ),
                            );
                            if (result == true) {
                              onRefresh.call();
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "|",
                            style: Font.fix(13).semiBold(
                              color: AppColor.headerTile,
                            ),
                          ),
                        ),
                        TableButton(
                          tips: 'View',
                          icon: IconlyLight.show,
                          onTap: () {
                            AppRouter.nav.pushParemeter(
                              const OutletuserListRoute(),
                              encrypt: false,
                              parameter: {
                                "id": item.id,
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

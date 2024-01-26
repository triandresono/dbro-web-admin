part of '../sysconfig_type_worker.dart';

class _Table extends StatelessWidget {
  final List<SysconfigTypeListItem> list;
  const _Table({required this.list});

  @override
  Widget build(BuildContext context) {
    return TableParent(
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
                'Type Name',
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
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TableButton(
                        tips: 'View',
                        icon: IconlyLight.show,
                        onTap: () {
                          AppRouter.nav.pushParemeter(
                            const SysconfigListRoute(),
                            encrypt: false,
                            parameter: {
                              "id": item.id,
                              "type": item.name,
                            },
                          );
                        },
                      ),
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

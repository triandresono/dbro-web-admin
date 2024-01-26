part of '../role_worker.dart';

class _Table extends StatelessWidget {
  final List<SysconfigListItem> list;
  final bool isLoading;
  const _Table({
    required this.list,
    required this.isLoading,
  });

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
                'Role Name',
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
                        item.value,
                        style: Font.fix(13).semiBold(
                          color: AppColor.headerTile,
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Skeletonizer(
                      enabled: isLoading,
                      child: Row(
                        children: [
                          TableButton(
                            enabled: item.id.unequal(Consts.sys_master_id),
                            tips: 'Delete',
                            icon: IconlyLight.delete,
                            onTap: () {},
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
                            tips: 'Edit',
                            icon: IconlyLight.edit_square,
                            enabled: item.id.unequal(Consts.sys_master_id),
                            onTap: () {
                              AppRouter.nav.pushParemeter(
                                const EditRoleRoute(),
                                encrypt: false,
                                parameter: {
                                  "id": item.id,
                                  "role": item.value,
                                },
                              );
                            },
                          ),
                        ],
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

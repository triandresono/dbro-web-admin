part of '../user_list_worker.dart';

class _Table extends StatelessWidget {
  final List<UserAllItem> list;
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
                'Name',
                style: Font.fix(14).semiBold(
                  color: AppColor.headerTile,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Role',
                style: Font.fix(14).semiBold(
                  color: AppColor.headerTile,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Division',
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
                        item.name,
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
                        item.role,
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
                        item.division,
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
                        tips: 'View Clockin',
                        icon: IconlyLight.time_circle,
                        onTap: () async {
                          AppRouter.nav.pushParemeter(
                            const UserClockinRoute(),
                            encrypt: false,
                            parameter: {
                              "id": item.id,
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

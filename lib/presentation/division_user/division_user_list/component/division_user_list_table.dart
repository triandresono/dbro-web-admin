part of '../division_user_list_worker.dart';

class _Table extends StatelessWidget {
  final List<UserDivisionItem> list;
  final DivisionUserListBloc bloc;
  final bool isLoading;
  const _Table({
    required this.list,
    required this.bloc,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollableTableParent(
      width: 1500,
      child: Card(
        elevation: 8.0,
        shadowColor: Colors.grey.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
              color: Color.fromARGB(179, 34, 25, 25), width: 1),
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
                'Email',
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
                        item.email,
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
                        item.createdBy,
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
                        item.createdDate,
                        style: Font.fix(13).semiBold(
                          color: AppColor.headerTile,
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(left: 9),
                      child: TableButton(
                        tips: 'Remove User',
                        icon: IconlyLight.delete,
                        onTap: () async {
                          final result = await AppRouter.nav.dialog(
                            dialog: const ConfirmationDialog(
                              title: "Are you sure?",
                              content: "Delete this user from current division",
                              okButton: "Delete",
                              cancelButton: "Cancel",
                            ),
                          );
                          if (result == true) {
                            bloc.removeUser(item.id);
                          }
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

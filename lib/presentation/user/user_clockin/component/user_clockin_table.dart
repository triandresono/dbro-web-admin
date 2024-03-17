part of '../user_clockin_worker.dart';

class _Table extends StatelessWidget {
  final List<ClockInUserListItem> list;
  final UserClockinBloc bloc;
  final bool isLoading;
  const _Table({
    required this.list,
    required this.bloc,
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
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PrefixBaseInput(
                controller: bloc.userNameCo,
                fillColor: Colors.white,
                labelBgColor: Colors.white,
                enable: false,
                hint: "Username",
                leading: (p0) {
                  return FieldIconSuffix(
                    padding: const EdgeInsets.only(left: 16),
                    icon: Icon(
                      IconlyLight.profile,
                      color: p0,
                      size: 17,
                    ),
                  );
                },
              ),
            ),
            ExpandedRow(
              child: DataTable(
                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Type',
                      style: Font.fix(14).semiBold(
                        color: AppColor.headerTile,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Time',
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
                ],
                rows: list.map(
                  (item) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Skeletonizer(
                            enabled: isLoading,
                            child: Text(
                              item.clockType,
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
                              item.clockInDate,
                              style: Font.fix(13).semiBold(
                                color: item.lateFlag
                                    ? Colors.redAccent
                                    : Colors.green,
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Skeletonizer(
                            enabled: isLoading,
                            child: Text(
                              item.divisionName,
                              style: Font.fix(13).semiBold(
                                color: AppColor.headerTile,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

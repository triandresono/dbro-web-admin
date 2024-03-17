part of '../user_attendance_worker.dart';

class _Table extends StatelessWidget {
  final List<UserAttendanceItem> list;
  const _Table({
    required this.list,
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
                'Division',
                style: Font.fix(14).semiBold(
                  color: AppColor.headerTile,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'MK',
                style: Font.fix(14).semiBold(
                  color: AppColor.headerTile,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'LS',
                style: Font.fix(14).semiBold(
                  color: AppColor.headerTile,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'LN',
                style: Font.fix(14).semiBold(
                  color: AppColor.headerTile,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'SKD',
                style: Font.fix(14).semiBold(
                  color: AppColor.headerTile,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'CT',
                style: Font.fix(14).semiBold(
                  color: AppColor.headerTile,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'DISP',
                style: Font.fix(14).semiBold(
                  color: AppColor.headerTile,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'OT',
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
                      item.userName,
                      style: Font.fix(13).semiBold(
                        color: AppColor.headerTile,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item.divisionName,
                      style: Font.fix(13).semiBold(
                        color: AppColor.headerTile,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item.mk.dotSeparator,
                      style: Font.fix(13).semiBold(
                        color: AppColor.headerTile,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item.ls.dotSeparator,
                      style: Font.fix(13).semiBold(
                        color: AppColor.headerTile,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item.ln.dotSeparator,
                      style: Font.fix(13).semiBold(
                        color: AppColor.headerTile,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item.skd.dotSeparator,
                      style: Font.fix(13).semiBold(
                        color: AppColor.headerTile,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item.ct.dotSeparator,
                      style: Font.fix(13).semiBold(
                        color: AppColor.headerTile,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item.disp.dotSeparator,
                      style: Font.fix(13).semiBold(
                        color: AppColor.headerTile,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      item.ot.toString(),
                      style: Font.fix(13).semiBold(
                        color: AppColor.headerTile,
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

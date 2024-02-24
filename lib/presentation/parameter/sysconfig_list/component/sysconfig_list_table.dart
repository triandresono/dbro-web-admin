part of '../sysconfig_list_worker.dart';

class _Table extends StatelessWidget {
  final List<SysconfigListItem> list;
  final SysconfigListBloc bloc;
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
                controller: TextEditingController()..text = bloc.argument.type,
                fillColor: Colors.white,
                labelBgColor: Colors.white,
                enable: false,
                hint: "Selected Type",
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
              child: DataTable(
                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                      'System Config Name',
                      style: Font.fix(14).semiBold(
                        color: AppColor.headerTile,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'System Config Value',
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
                              item.key,
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
                              item.value,
                              style: Font.fix(13).semiBold(
                                color: AppColor.headerTile,
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Row(
                            children: [
                              TableButton(
                                tips: 'Delete',
                                icon: IconlyLight.delete,
                                enabled: false,
                                onTap: () {},
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
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
                                enabled: false,
                                onTap: () {},
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
          ],
        ),
      ),
    );
  }
}

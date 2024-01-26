part of '../edit_role_worker.dart';

class _Tile extends StatelessWidget {
  final PermissionListItem item;
  final EditRoleBloc bloc;
  const _Tile({
    required this.item,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final state = item.actionState.value;
      return CommonShimmer(
        isLoading: state is LoadingCase,
        child: Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 4,
          shadowColor: AppColor.greyField.withOpacity(0.5),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 16,
            ),
            onTap: () {
              if (item.id.isNotEmpty) {
                bloc.deletePermission(item);
              } else {
                bloc.createPermission(item);
              }
            },
            leading: Checkbox(
              activeColor: AppColor.mainOrange,
              value: item.checked.value,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              onChanged: (val) {},
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.apiPathKey.titleCase,
                  style: Font.fix(16).medium(
                    color: AppColor.headerTile,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  item.apiPathValue,
                  style: Font.fix(14).medium(
                    color: AppColor.grey.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

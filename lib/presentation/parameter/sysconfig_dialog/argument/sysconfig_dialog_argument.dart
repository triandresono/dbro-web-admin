import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_list.dart';

class SysconfigDialogArgument {
  final String type;
  final String title;
  final SysconfigListItem? selected;
  SysconfigDialogArgument({
    required this.title,
    required this.type,
    this.selected,
  });
}

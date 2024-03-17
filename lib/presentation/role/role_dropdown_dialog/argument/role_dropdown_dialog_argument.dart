import 'package:dbro_admin/domain/entity/sysconfig/role_dropdown.dart';

class RoleDropdownDialogArgument {
  final RoleDropdownItem? selected;
  final String title;

  RoleDropdownDialogArgument({
    required this.selected,
    required this.title,
  });
}

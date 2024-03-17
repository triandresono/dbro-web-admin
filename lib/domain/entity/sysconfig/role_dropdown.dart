class RoleDropdown {
  final List<RoleDropdownItem> list;

  RoleDropdown({
    this.list = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory RoleDropdown.fromMap(Map<String, dynamic> map) {
    return RoleDropdown(
      list: map['list'] != null
          ? List<RoleDropdownItem>.from(
              (map['list'] as List).map<RoleDropdownItem>(
                (x) => RoleDropdownItem.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class RoleDropdownItem {
  final String roleId;
  final String name;

  RoleDropdownItem({
    this.roleId = '',
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'roleId': roleId,
      'name': name,
    };
  }

  factory RoleDropdownItem.fromMap(Map<String, dynamic> map) {
    return RoleDropdownItem(
      roleId: map['roleId'] ?? '',
      name: map['name'] ?? '',
    );
  }
}

class RoleDropdownResponse {
  final List<RoleDropdownResponseItem> list;

  RoleDropdownResponse({
    this.list = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory RoleDropdownResponse.fromMap(Map<String, dynamic> map) {
    return RoleDropdownResponse(
      list: map['list'] != null
          ? List<RoleDropdownResponseItem>.from(
              (map['list'] as List).map<RoleDropdownResponseItem>(
                (x) => RoleDropdownResponseItem.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class RoleDropdownResponseItem {
  final String roleId;
  final String name;

  RoleDropdownResponseItem({
    this.roleId = '',
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'roleId': roleId,
      'name': name,
    };
  }

  factory RoleDropdownResponseItem.fromMap(Map<String, dynamic> map) {
    return RoleDropdownResponseItem(
      roleId: map['roleId'] ?? '',
      name: map['name'] ?? '',
    );
  }
}

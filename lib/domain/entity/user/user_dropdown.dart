class UserDropdown {
  final List<UserDropdownItem> list;

  UserDropdown({this.list = const []});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory UserDropdown.fromMap(Map<String, dynamic> map) {
    return UserDropdown(
      list: map['list'] != null
          ? List<UserDropdownItem>.from(
              (map['list']).map<UserDropdownItem>(
                (x) => UserDropdownItem.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class UserDropdownItem {
  final String id;
  final String name;

  UserDropdownItem({
    this.id = '',
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory UserDropdownItem.fromMap(Map<String, dynamic> map) {
    return UserDropdownItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }
}

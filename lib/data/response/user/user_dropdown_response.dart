class UserDropdownResponse {
  final List<UserDropdownResponseItem> list;

  UserDropdownResponse({this.list = const []});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory UserDropdownResponse.fromMap(Map<String, dynamic> map) {
    return UserDropdownResponse(
      list: map['list'] != null
          ? List<UserDropdownResponseItem>.from(
              (map['list']).map<UserDropdownResponseItem>(
                (x) => UserDropdownResponseItem.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class UserDropdownResponseItem {
  final String id;
  final String name;

  UserDropdownResponseItem({
    this.id = '',
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory UserDropdownResponseItem.fromMap(Map<String, dynamic> map) {
    return UserDropdownResponseItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }
}

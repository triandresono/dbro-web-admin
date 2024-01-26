class UserDivisionResponse {
  final List<UserDivisionResponseItem> list;

  UserDivisionResponse({
    this.list = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory UserDivisionResponse.fromMap(Map<String, dynamic> map) {
    return UserDivisionResponse(
      list: map['list'] != null
          ? List<UserDivisionResponseItem>.from(
              (map['list'] as List).map<UserDivisionResponseItem>(
                (x) => UserDivisionResponseItem.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class UserDivisionResponseItem {
  final String id;
  final String name;
  final String createdDate;
  final String createdBy;

  UserDivisionResponseItem({
    this.id = '',
    this.name = '',
    this.createdDate = '',
    this.createdBy = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'createdDate': createdDate,
      'createdBy': createdBy,
    };
  }

  factory UserDivisionResponseItem.fromMap(Map<String, dynamic> map) {
    return UserDivisionResponseItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      createdDate: map['createdDate'] ?? '',
      createdBy: map['createdBy'] ?? '',
    );
  }
}

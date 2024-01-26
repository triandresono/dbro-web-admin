class UserDivision {
  final List<UserDivisionItem> list;

  UserDivision({
    this.list = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory UserDivision.fromMap(Map<String, dynamic> map) {
    return UserDivision(
      list: map['list'] != null
          ? List<UserDivisionItem>.from(
              (map['list'] as List).map<UserDivisionItem>(
                (x) => UserDivisionItem.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class UserDivisionItem {
  final String id;
  final String name;
  final String createdDate;
  final String createdBy;

  UserDivisionItem({
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

  factory UserDivisionItem.fromMap(Map<String, dynamic> map) {
    return UserDivisionItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      createdDate: map['createdDate'] ?? '',
      createdBy: map['createdBy'] ?? '',
    );
  }
}

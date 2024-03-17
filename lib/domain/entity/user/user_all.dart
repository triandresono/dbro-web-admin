class UserAll {
  final List<UserAllItem> userListingResultSets;
  final int totalCount;

  UserAll({
    this.totalCount = 0,
    this.userListingResultSets = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userListingResultSets':
          userListingResultSets.map((x) => x.toMap()).toList(),
      'totalCount': totalCount,
    };
  }

  factory UserAll.fromMap(Map<String, dynamic> map) {
    return UserAll(
      userListingResultSets: map['userListingResultSets'] != null
          ? List<UserAllItem>.from(
              (map['userListingResultSets'] as List).map<UserAllItem>(
                (x) => UserAllItem.fromMap(x),
              ),
            )
          : [],
      totalCount: map['totalCount'] ?? 0,
    );
  }

  factory UserAll.dummy() {
    return UserAll(
      userListingResultSets: List.generate(5, (index) {
        return UserAllItem(
          name: "LOADING",
          joinDate: "LOADING",
          role: "LOADING",
          division: "LOADING",
        );
      }),
    );
  }
}

class UserAllItem {
  final String id;
  final String name;
  final String joinDate;
  final String createdBy;
  final String role;
  final String division;

  UserAllItem({
    this.id = '',
    this.name = '',
    this.joinDate = '',
    this.createdBy = '',
    this.role = '',
    this.division = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'joinDate': joinDate,
      'createdBy': createdBy,
      'role': role,
      'division': division,
    };
  }

  factory UserAllItem.fromMap(Map<String, dynamic> map) {
    return UserAllItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      joinDate: map['joinDate'] ?? '',
      createdBy: map['createdBy'] ?? '',
      role: map['role'] ?? '',
      division: map['division'] ?? '',
    );
  }
}

class UserAllResponse {
  final List<UserAllResponseItem> userListingResultSets;
  final int totalCount;

  UserAllResponse({
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

  factory UserAllResponse.fromMap(Map<String, dynamic> map) {
    return UserAllResponse(
      userListingResultSets: map['userListingResultSets'] != null
          ? List<UserAllResponseItem>.from(
              (map['userListingResultSets'] as List).map<UserAllResponseItem>(
                (x) => UserAllResponseItem.fromMap(x),
              ),
            )
          : [],
      totalCount: map['totalCount'] ?? 0,
    );
  }
}

class UserAllResponseItem {
  final String id;
  final String name;
  final String joinDate;
  final String createdBy;
  final String role;
  final String division;

  UserAllResponseItem({
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

  factory UserAllResponseItem.fromMap(Map<String, dynamic> map) {
    return UserAllResponseItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      joinDate: map['joinDate'] ?? '',
      createdBy: map['createdBy'] ?? '',
      role: map['role'] ?? '',
      division: map['division'] ?? '',
    );
  }
}

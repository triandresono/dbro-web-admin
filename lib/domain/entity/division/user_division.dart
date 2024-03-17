class UserDivision {
  final List<UserDivisionItem> divisionUserListingDTOs;

  UserDivision({
    this.divisionUserListingDTOs = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'divisionUserListingDTOs':
          divisionUserListingDTOs.map((x) => x.toMap()).toList(),
    };
  }

  factory UserDivision.fromMap(Map<String, dynamic> map) {
    return UserDivision(
      divisionUserListingDTOs: map['divisionUserListingDTOs'] != null
          ? List<UserDivisionItem>.from(
              (map['divisionUserListingDTOs'] as List).map<UserDivisionItem>(
                (x) => UserDivisionItem.fromMap(x),
              ),
            )
          : [],
    );
  }

  factory UserDivision.dummy() {
    return UserDivision(
      divisionUserListingDTOs: List.generate(3, (_) {
        return UserDivisionItem(
          createdBy: "LOADING VALUE",
          email: 'LOADING VALUE',
          createdDate: "LOADING VALUE",
          id: "LOADING VALUE",
          name: "LOADING VALUE",
          role: "LOADING VALUE",
        );
      }),
    );
  }
}

class UserDivisionItem {
  final String id;
  final String name;
  final String email;
  final String role;
  final String createdDate;
  final String createdBy;

  UserDivisionItem({
    this.id = '',
    this.name = '',
    this.createdDate = '',
    this.createdBy = '',
    this.email = '',
    this.role = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'createdDate': createdDate,
      'createdBy': createdBy,
      'email': email,
      'role': role,
    };
  }

  factory UserDivisionItem.fromMap(Map<String, dynamic> map) {
    return UserDivisionItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      createdDate: map['createdDate'] ?? '',
      createdBy: map['createdBy'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
    );
  }
}

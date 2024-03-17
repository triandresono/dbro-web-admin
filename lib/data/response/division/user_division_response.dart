class UserDivisionResponse {
  final List<UserDivisionResponseItem> divisionUserListingDTOs;

  UserDivisionResponse({
    this.divisionUserListingDTOs = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'divisionUserListingDTOs':
          divisionUserListingDTOs.map((x) => x.toMap()).toList(),
    };
  }

  factory UserDivisionResponse.fromMap(Map<String, dynamic> map) {
    return UserDivisionResponse(
      divisionUserListingDTOs: map['divisionUserListingDTOs'] != null
          ? List<UserDivisionResponseItem>.from(
              (map['divisionUserListingDTOs'] as List)
                  .map<UserDivisionResponseItem>(
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
  final String email;
  final String role;
  final String createdDate;
  final String createdBy;

  UserDivisionResponseItem({
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

  factory UserDivisionResponseItem.fromMap(Map<String, dynamic> map) {
    return UserDivisionResponseItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      createdDate: map['createdDate'] ?? '',
      createdBy: map['createdBy'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
    );
  }
}

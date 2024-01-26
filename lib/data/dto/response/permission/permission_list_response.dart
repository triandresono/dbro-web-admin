class PermissionListResponse {
  final List<PermissionListResponseItem> dtos;
  final int count;

  PermissionListResponse({
    this.dtos = const [],
    this.count = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'permissionDTOs': dtos.map((x) => x.toMap()).toList(),
      'count': count,
    };
  }

  factory PermissionListResponse.fromMap(Map<String, dynamic> map) {
    return PermissionListResponse(
      count: map['count'] ?? 0,
      dtos: map['permissionDTOs'] != null
          ? List<PermissionListResponseItem>.from(
              (map['permissionDTOs'] as List).map<PermissionListResponseItem>(
                (x) => PermissionListResponseItem.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class PermissionListResponseItem {
  final String id;
  final String createdDate;
  final String createdBy;
  final String lastModifiedDate;
  final String lastModifiedBy;
  final String role;
  final String apiPathKey;
  final String apiPathValue;
  final String apiPathId;

  PermissionListResponseItem({
    this.id = '',
    this.createdDate = '',
    this.createdBy = '',
    this.lastModifiedDate = '',
    this.lastModifiedBy = '',
    this.role = '',
    this.apiPathId = '',
    this.apiPathKey = '',
    this.apiPathValue = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdDate': createdDate,
      'createdBy': createdBy,
      'lastModifiedDate': lastModifiedDate,
      'lastModifiedBy': lastModifiedBy,
      'role': role,
      'apiPathKey': apiPathKey,
      'apiPathValue': apiPathValue,
      'apiPathId': apiPathId,
    };
  }

  factory PermissionListResponseItem.fromMap(Map<String, dynamic> map) {
    return PermissionListResponseItem(
      id: map['id'] ?? '',
      createdDate: map['createdDate'] ?? '',
      createdBy: map['createdBy'] ?? '',
      lastModifiedDate: map['lastModifiedDate'] ?? '',
      lastModifiedBy: map['lastModifiedBy'] ?? '',
      role: map['role'] ?? '',
      apiPathKey: map['apiPathKey'] ?? '',
      apiPathValue: map['apiPathValue'] ?? '',
      apiPathId: map['apiPathId'] ?? '',
    );
  }
}

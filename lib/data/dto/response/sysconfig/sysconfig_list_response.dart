class SysconfigListResponse {
  final List<SysconfigListResponseItem> dtos;
  final int totalCount;

  SysconfigListResponse({
    required this.dtos,
    required this.totalCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sysconfigDTOs': dtos.map((x) => x.toMap()).toList(),
      'totalCount': totalCount,
    };
  }

  factory SysconfigListResponse.fromMap(Map<String, dynamic> map) {
    return SysconfigListResponse(
      totalCount: map['totalCount'] ?? 0,
      dtos: map['sysconfigDTOs'] != null
          ? List<SysconfigListResponseItem>.from(
              (map['sysconfigDTOs'] as List).map<SysconfigListResponseItem>(
                (x) => SysconfigListResponseItem.fromMap(
                    x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }
}

class SysconfigListResponseItem {
  final String id;
  final String createdDate;
  final String createdBy;
  final String lastModifiedDate;
  final String lastModifiedBy;
  final String key;
  final String value;

  SysconfigListResponseItem({
    required this.id,
    required this.createdDate,
    required this.createdBy,
    required this.lastModifiedDate,
    required this.lastModifiedBy,
    required this.key,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdDate': createdDate,
      'createdBy': createdBy,
      'lastModifiedDate': lastModifiedDate,
      'lastModifiedBy': lastModifiedBy,
      'key': key,
      'value': value,
    };
  }

  factory SysconfigListResponseItem.fromMap(Map<String, dynamic> map) {
    return SysconfigListResponseItem(
      id: map['id'] ?? '',
      createdDate: map['createdDate'] ?? '',
      createdBy: map['createdBy'] ?? '',
      lastModifiedDate: map['lastModifiedDate'] ?? '',
      lastModifiedBy: map['lastModifiedBy'] ?? '',
      key: map['key'] ?? '',
      value: map['value'] ?? '',
    );
  }
}

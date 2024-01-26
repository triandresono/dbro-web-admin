class SysconfigTypeListResponse {
  final int totalCount;
  final List<SysconfigTypeListResponseItem> sysconfigTypeDTOs;

  SysconfigTypeListResponse({
    required this.totalCount,
    required this.sysconfigTypeDTOs,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalCount': totalCount,
      'sysconfigTypeDTOs': sysconfigTypeDTOs.map((x) => x.toMap()).toList(),
    };
  }

  factory SysconfigTypeListResponse.fromMap(Map<String, dynamic> map) {
    return SysconfigTypeListResponse(
      totalCount: map['totalCount'] as int,
      sysconfigTypeDTOs: map['sysconfigTypeDTOs'] != null
          ? List<SysconfigTypeListResponseItem>.from(
              (map['sysconfigTypeDTOs'] as List)
                  .map<SysconfigTypeListResponseItem>(
                (x) => SysconfigTypeListResponseItem.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class SysconfigTypeListResponseItem {
  final String id;
  final String createdDate;
  final String createdBy;
  final String lastModifiedDate;
  final String lastModifiedBy;
  final String name;

  SysconfigTypeListResponseItem({
    required this.id,
    required this.createdDate,
    required this.createdBy,
    required this.lastModifiedDate,
    required this.lastModifiedBy,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdDate': createdDate,
      'createdBy': createdBy,
      'lastModifiedDate': lastModifiedDate,
      'lastModifiedBy': lastModifiedBy,
      'name': name,
    };
  }

  factory SysconfigTypeListResponseItem.fromMap(Map<String, dynamic> map) {
    return SysconfigTypeListResponseItem(
      id: map['id'] ?? '',
      createdDate: map['createdDate'] ?? '',
      createdBy: map['createdBy'] ?? '',
      lastModifiedDate: map['lastModifiedDate'] ?? '',
      lastModifiedBy: map['lastModifiedBy'] ?? '',
      name: map['name'] ?? '',
    );
  }
}

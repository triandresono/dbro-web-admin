class DivisionListResponse {
  final List<DivisionListResponseItem> divisionListingDTOs;
  final int totalCount;

  DivisionListResponse({
    this.divisionListingDTOs = const [],
    this.totalCount = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'divisionListingDTOs': divisionListingDTOs.map((x) => x.toMap()).toList(),
      'totalCount': totalCount,
    };
  }

  factory DivisionListResponse.fromMap(Map<String, dynamic> map) {
    return DivisionListResponse(
      totalCount: map['totalCount'] ?? 0,
      divisionListingDTOs: map['divisionListingDTOs'] != null
          ? List<DivisionListResponseItem>.from(
              (map['divisionListingDTOs'] as List)
                  .map<DivisionListResponseItem>(
                (x) => DivisionListResponseItem.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class DivisionListResponseItem {
  final String id;
  final String name;
  final String createdDate;
  final String createdBy;

  DivisionListResponseItem({
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

  factory DivisionListResponseItem.fromMap(Map<String, dynamic> map) {
    return DivisionListResponseItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      createdDate: map['createdDate'] ?? '',
      createdBy: map['createdBy'] ?? '',
    );
  }
}

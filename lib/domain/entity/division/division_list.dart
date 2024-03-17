class DivisionList {
  final List<DivisionListItem> divisionListingDTOs;
  final int totalCount;

  DivisionList({
    this.divisionListingDTOs = const [],
    this.totalCount = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'divisionListingDTOs': divisionListingDTOs.map((x) => x.toMap()).toList(),
      'totalCount': totalCount,
    };
  }

  factory DivisionList.fromMap(Map<String, dynamic> map) {
    return DivisionList(
      totalCount: map['totalCount'] ?? 0,
      divisionListingDTOs: map['divisionListingDTOs'] != null
          ? List<DivisionListItem>.from(
              (map['divisionListingDTOs'] as List).map<DivisionListItem>(
                (x) => DivisionListItem.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class DivisionListItem {
  final String id;
  final String name;
  final String createdDate;
  final String createdBy;

  DivisionListItem({
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

  factory DivisionListItem.fromMap(Map<String, dynamic> map) {
    return DivisionListItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      createdDate: map['createdDate'] ?? '',
      createdBy: map['createdBy'] ?? '',
    );
  }
}

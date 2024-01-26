class DivisionListResponse {
  final List<DivisionListResponseItem> divisionDTOs;

  DivisionListResponse({
    this.divisionDTOs = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'divisionDTOs': divisionDTOs.map((x) => x.toMap()).toList(),
    };
  }

  factory DivisionListResponse.fromMap(Map<String, dynamic> map) {
    return DivisionListResponse(
      divisionDTOs: map['divisionDTOs'] != null
          ? List<DivisionListResponseItem>.from(
              (map['divisionDTOs'] as List).map<DivisionListResponseItem>(
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

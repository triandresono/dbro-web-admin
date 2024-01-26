class DivisionList {
  final List<DivisionListItem> divisionDTOs;

  DivisionList({
    this.divisionDTOs = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'divisionDTOs': divisionDTOs.map((x) => x.toMap()).toList(),
    };
  }

  factory DivisionList.fromMap(Map<String, dynamic> map) {
    return DivisionList(
      divisionDTOs: map['divisionDTOs'] != null
          ? List<DivisionListItem>.from(
              (map['divisionDTOs'] as List).map<DivisionListItem>(
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

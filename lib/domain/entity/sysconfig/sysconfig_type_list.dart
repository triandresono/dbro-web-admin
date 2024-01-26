class SysconfigTypeList {
  final int totalCount;
  final List<SysconfigTypeListItem> sysconfigTypeDTOs;

  SysconfigTypeList({
    this.totalCount = 0,
    this.sysconfigTypeDTOs = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalCount': totalCount,
      'sysconfigTypeDTOs': sysconfigTypeDTOs.map((x) => x.toMap()).toList(),
    };
  }

  factory SysconfigTypeList.fromMap(Map<String, dynamic> map) {
    return SysconfigTypeList(
      totalCount: map['totalCount'] as int,
      sysconfigTypeDTOs: map['sysconfigTypeDTOs'] != null
          ? List<SysconfigTypeListItem>.from(
              (map['sysconfigTypeDTOs'] as List).map<SysconfigTypeListItem>(
                (x) => SysconfigTypeListItem.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class SysconfigTypeListItem {
  final String id;
  final String createdDate;
  final String createdBy;
  final String lastModifiedDate;
  final String lastModifiedBy;
  final String name;

  SysconfigTypeListItem({
    this.id = '',
    this.createdDate = '',
    this.createdBy = '',
    this.lastModifiedDate = '',
    this.lastModifiedBy = '',
    this.name = '',
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

  factory SysconfigTypeListItem.fromMap(Map<String, dynamic> map) {
    return SysconfigTypeListItem(
      id: map['id'] ?? '',
      createdDate: map['createdDate'] ?? '',
      createdBy: map['createdBy'] ?? '',
      lastModifiedDate: map['lastModifiedDate'] ?? '',
      lastModifiedBy: map['lastModifiedBy'] ?? '',
      name: map['name'] ?? '',
    );
  }
}

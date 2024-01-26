class SysconfigDetail {
  final String id;
  final String createdDate;
  final String createdBy;
  final String lastModifiedDate;
  final String lastModifiedBy;
  final String name;

  SysconfigDetail({
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

  factory SysconfigDetail.fromMap(Map<String, dynamic> map) {
    return SysconfigDetail(
      id: map['id'] ?? '',
      createdDate: map['createdDate'] ?? '',
      createdBy: map['createdBy'] ?? '',
      lastModifiedDate: map['lastModifiedDate'] ?? '',
      lastModifiedBy: map['lastModifiedBy'] ?? '',
      name: map['name'] ?? '',
    );
  }
}

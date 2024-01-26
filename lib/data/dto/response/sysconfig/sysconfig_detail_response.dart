class SysconfigDetailResponse {
  final String id;
  final String createdDate;
  final String createdBy;
  final String lastModifiedDate;
  final String lastModifiedBy;
  final String name;

  SysconfigDetailResponse({
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

  factory SysconfigDetailResponse.fromMap(Map<String, dynamic> map) {
    return SysconfigDetailResponse(
      id: map['id'] ?? '',
      createdDate: map['createdDate'] ?? '',
      createdBy: map['createdBy'] ?? '',
      lastModifiedDate: map['lastModifiedDate'] ?? '',
      lastModifiedBy: map['lastModifiedBy'] ?? '',
      name: map['name'] ?? '',
    );
  }
}

import 'package:dbro_admin/data/dto/response/generic_response.dart';

class SysconfigList extends Generic {
  final List<SysconfigListItem> dtos;
  final int totalCount;

  SysconfigList({
    Status? status,
    this.dtos = const [],
    this.totalCount = 0,
  }) : super(status: status);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sysconfigDTOs': dtos.map((x) => x.toMap()).toList(),
      'totalCount': totalCount,
    };
  }

  factory SysconfigList.fromMap(Map<String, dynamic> map) {
    return SysconfigList(
      status: Status.failure(map),
      dtos: map['sysconfigDTOs'] != null
          ? List<SysconfigListItem>.from(
              (map['sysconfigDTOs'] as List).map<SysconfigListItem>(
                (x) => SysconfigListItem.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      totalCount: map['totalCount'] ?? 0,
    );
  }

  factory SysconfigList.dummy() {
    return SysconfigList(
      dtos: [
        SysconfigListItem(key: "LOADING VALUE", value: "LOADING VALUE"),
        SysconfigListItem(key: "LOADING VALUE", value: "LOADING VALUE"),
        SysconfigListItem(key: "LOADING VALUE", value: "LOADING VALUE"),
      ],
    );
  }
}

class SysconfigListItem {
  final String id;
  final String createdDate;
  final String createdBy;
  final String lastModifiedDate;
  final String lastModifiedBy;
  final String key;
  final String value;

  SysconfigListItem({
    this.id = '',
    this.createdDate = '',
    this.createdBy = '',
    this.lastModifiedDate = '',
    this.lastModifiedBy = '',
    this.key = '',
    this.value = '',
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

  factory SysconfigListItem.fromMap(Map<String, dynamic> map) {
    return SysconfigListItem(
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

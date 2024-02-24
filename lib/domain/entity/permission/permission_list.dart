import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:get/get.dart';

class PermissionList {
  final List<PermissionListItem> dtos;
  final int count;

  PermissionList({
    this.dtos = const [],
    this.count = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'permissionDTOs': dtos.map((x) => x.toMap()).toList(),
      'count': count,
    };
  }

  factory PermissionList.fromMap(Map<String, dynamic> map) {
    return PermissionList(
      count: map['count'] ?? 0,
      dtos: map['permissionDTOs'] != null
          ? List<PermissionListItem>.from(
              (map['permissionDTOs'] as List).map<PermissionListItem>(
                (x) => PermissionListItem.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class PermissionListItem {
  String id;
  final String createdDate;
  final String createdBy;
  final String lastModifiedDate;
  final String lastModifiedBy;
  final String role;
  final String apiPathKey;
  final String apiPathValue;
  final String apiPathId;

  //HELPER
  Rx<Case> actionState = Case().obs;
  Rx<bool> checked = false.obs;

  PermissionListItem({
    this.id = '',
    this.createdDate = '',
    this.createdBy = '',
    this.lastModifiedDate = '',
    this.lastModifiedBy = '',
    this.role = '',
    this.apiPathId = '',
    this.apiPathKey = '',
    this.apiPathValue = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdDate': createdDate,
      'createdBy': createdBy,
      'lastModifiedDate': lastModifiedDate,
      'lastModifiedBy': lastModifiedBy,
      'role': role,
      'apiPathKey': apiPathKey,
      'apiPathValue': apiPathValue,
      'apiPathId': apiPathId,
    };
  }

  factory PermissionListItem.fromMap(Map<String, dynamic> map) {
    return PermissionListItem(
      id: map['id'] ?? '',
      createdDate: map['createdDate'] ?? '',
      createdBy: map['createdBy'] ?? '',
      lastModifiedDate: map['lastModifiedDate'] ?? '',
      lastModifiedBy: map['lastModifiedBy'] ?? '',
      role: map['role'] ?? '',
      apiPathKey: map['apiPathKey'] ?? '',
      apiPathValue: map['apiPathValue'] ?? '',
      apiPathId: map['apiPathId'] ?? '',
    );
  }
}

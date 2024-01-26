class MyPermission {
  final List<NyPermissionList> list;

  MyPermission({this.list = const []});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory MyPermission.fromMap(Map<String, dynamic> map) {
    return MyPermission(
      list: map['list'] != null
          ? List<NyPermissionList>.from(
              (map['list'] as List).map<NyPermissionList>(
                (x) => NyPermissionList.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class NyPermissionList {
  final String apiPathKey;
  final String apiPathValue;

  NyPermissionList({
    this.apiPathKey = '',
    this.apiPathValue = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'apiPathKey': apiPathKey,
      'apiPathValue': apiPathValue,
    };
  }

  factory NyPermissionList.fromMap(Map<String, dynamic> map) {
    return NyPermissionList(
      apiPathKey: map['apiPathKey'] ?? '',
      apiPathValue: map['apiPathValue'] ?? '',
    );
  }
}

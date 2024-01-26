class MyPermissionResponse {
  final List<NyPermissionListResponse> list;

  MyPermissionResponse({
    required this.list,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory MyPermissionResponse.fromMap(Map<String, dynamic> map) {
    return MyPermissionResponse(
      list: map['list'] != null
          ? List<NyPermissionListResponse>.from(
              (map['list'] as List).map<NyPermissionListResponse>(
                (x) => NyPermissionListResponse.fromMap(x),
              ),
            )
          : [],
    );
  }
}

class NyPermissionListResponse {
  final String apiPathKey;
  final String apiPathValue;

  NyPermissionListResponse({
    required this.apiPathKey,
    required this.apiPathValue,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'apiPathKey': apiPathKey,
      'apiPathValue': apiPathValue,
    };
  }

  factory NyPermissionListResponse.fromMap(Map<String, dynamic> map) {
    return NyPermissionListResponse(
      apiPathKey: map['apiPathKey'] ?? '',
      apiPathValue: map['apiPathValue'] ?? '',
    );
  }
}
